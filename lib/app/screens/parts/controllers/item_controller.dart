import 'dart:math' as mt;

import 'package:flutter_barraginha/app/shared/database/entities/info_part.dart';
import 'package:flutter_barraginha/app/shared/database/entities/point.dart';
import 'package:flutter_barraginha/app/shared/database/entities/soil_type.dart';
import 'package:flutter_barraginha/app/shared/database/responses/display_part.dart';
import 'package:flutter_barraginha/app/shared/database/responses/display_project_response.dart';
import 'package:flutter_barraginha/app/shared/exceptions/web_exception.dart';
import 'package:flutter_barraginha/app/shared/services/geolocator_service.dart';
import 'package:flutter_barraginha/app/shared/services/google_earth_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

part 'item_controller.g.dart';

enum StateItem {
  loading,
  none,
  calculate,
}

class ItemController = _ItemControllerBase with _$ItemController;

abstract class _ItemControllerBase with Store {
  @observable
  InfoPart? info;

  @observable
  StateItem state = StateItem.loading;

  final DisplayProjectResponse _project;
  final DisplayPart _part;

  _ItemControllerBase(this._project, this._part, Function(num) onCaculated) {
    calculate(onCaculated);
  }

  @action
  Future calculate(Function(num) onCaculated) async {
    changeItemState(StateItem.loading);

    Point start = Point.copy(_part.points[0]);
    Point end = Point.copy(_part.points[1]);

    info = await _calculate(
      start: start,
      end: end,
      roadWidth: _part.roadWidth!,
      rainVolume: 1,
      soilType: _project.soilType!,
    );

    if (info == null) {
      changeItemState(StateItem.calculate);
      return;
    }

    onCaculated(info!.barrageNumbersAdjusted);

    changeItemState(StateItem.none);
  }

  @action
  void changeItemState(StateItem newState) {
    state = newState;
  }

  Future<InfoPart?> _calculate({
    required Point start,
    required Point end,
    required SoilType soilType,
    required num roadWidth,
    required num rainVolume,
  }) async {
    final startLatitude = start.latitude!.toDouble();
    final startLongitude = start.longitude!.toDouble();
    final startLatLng = LatLng(startLatitude, startLongitude);

    final endLatitude = end.latitude!.toDouble();
    final endLongitude = end.longitude!.toDouble();
    final endLatLng = LatLng(endLatitude, endLongitude);

    if (start.altitude == null) {
      try {
        final value =
            await GoogleEarthService.getAltitude(startLatitude, startLongitude);
        start.altitude = value;
      } on WebException {
        return null;
      }
    } else {
      start.altitude = start.altitude!.toDouble();
    }

    if (end.altitude == null) {
      try {
        final value =
            await GoogleEarthService.getAltitude(endLatitude, endLongitude);

        end.altitude = value;
      } on WebException {
        return null;
      }
    } else {
      end.altitude = end.altitude!.toDouble();
    }

    final distance = GeolocatorService.getDistanceBetweenTwoPoints(
      startLatLng,
      endLatLng,
    );

    final levelDifference = (start.altitude! - end.altitude!).abs();
    final horizontalDifference =
        mt.sqrt(mt.pow(distance, 2) - mt.pow(levelDifference, 2));
    final declivity = (levelDifference * 100) / horizontalDifference;
    final horizontalSpacing =
        45.18 * soilType.value! * mt.pow(declivity, -0.42);
    final verticalSpacing = 0.4518 * soilType.value! * mt.pow(declivity, 0.58);
    final barrageNumbers = horizontalDifference / horizontalSpacing;
    final barrageNumbersAdjusted = barrageNumbers.round();
    final spacing = distance / barrageNumbersAdjusted;
    final runoffVolume = spacing * roadWidth * rainVolume;
    final depth = mt.pow((runoffVolume / 6.52), 1 / 3).toDouble();
    final radius = 2.41 * depth;
    final barrageVolume = 3.14 * mt.pow(depth, 2) * (radius - (depth / 3));

    start.altitude = convert(start.altitude!, decimal: 2);
    end.altitude = convert(end.altitude!, decimal: 2);

    start.latitude = convert(start.latitude!, decimal: 2);
    end.latitude = convert(end.latitude!, decimal: 2);

    start.longitude = convert(start.longitude!, decimal: 2);
    end.longitude = convert(end.longitude!, decimal: 2);

    info = InfoPart(
      pointA: start,
      pointB: end,
      soilType: soilType,
      distance: distance.round(),
      levelDifference: levelDifference.round(),
      horizontalDifference: convert(horizontalDifference, decimal: 1),
      declivity: convert(declivity, decimal: 1),
      horizontalSpacing: convert(horizontalSpacing, decimal: 1),
      verticalSpacing: convert(verticalSpacing, decimal: 1),
      barrageNumbers: convert(barrageNumbers, decimal: 1),
      barrageNumbersAdjusted: barrageNumbersAdjusted.round(),
      spacing: convert(spacing, decimal: 1),
      roadWidth: roadWidth,
      runoffVolume: convert(runoffVolume, decimal: 1),
      depth: convert(depth, decimal: 2),
      radius: convert(radius, decimal: 2),
      barrageVolume: convert(barrageVolume, decimal: 1),
    );

    return info;
  }

  num convert(num value, {int decimal = 1}) {
    return num.parse(value.toStringAsFixed(decimal));
  }
}
