// ignore_for_file: library_private_types_in_public_api

import 'package:flutter_barraginha/domain/entities/info_part.dart';
import 'package:flutter_barraginha/domain/entities/point.dart';
import 'package:flutter_barraginha/domain/entities/display_part.dart';
import 'package:flutter_barraginha/domain/entities/display_project_response.dart';
import 'package:flutter_barraginha/domain/use_cases/calculate_case.dart';
import 'package:flutter_barraginha/domain/use_cases/calculate_distance_between_coordinates_case.dart';
import 'package:flutter_barraginha/domain/use_cases/get_altitude_by_coordinate_case.dart';
import 'package:flutter_barraginha/infra/services/toast_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

part 'item_part_controller.g.dart';

enum StateItem {
  loading,
  none,
  calculate,
}

class ItemPartController = _ItemPartControllerBase with _$ItemPartController;

abstract class _ItemPartControllerBase with Store {
  @observable
  InfoPart? info;

  @observable
  StateItem state = StateItem.loading;

  final DisplayProjectResponse _project;
  final DisplayPart _part;
  final _calculateCase = Modular.get<CalculateCase>();
  final _getAltitudeByCoordinateCase =
      Modular.get<GetAltitudeByCoordinateCase>();
  final _calculateDistanceBetweenCoordinatesCase =
      Modular.get<CalculateDistanceBetweenCoordinatesCase>();

  _ItemPartControllerBase(this._project, this._part) {
    calculate();
  }

  @action
  Future<bool> calculate() async {
    state = StateItem.loading;

    Point start = Point.copy(_part.points[0]);
    Point end = Point.copy(_part.points[1]);

    try {
      start.altitude = await _getAltitudeByCoordinateCase(
        start.altitude,
        start.latitude!.toDouble(),
        start.longitude!.toDouble(),
      );
      end.altitude = await _getAltitudeByCoordinateCase(
        end.altitude,
        end.latitude!.toDouble(),
        end.longitude!.toDouble(),
      );

      final startLatLng = LatLng(
        start.latitude!.toDouble(),
        start.longitude!.toDouble(),
      );

      final endLatLng = LatLng(
        end.latitude!.toDouble(),
        end.longitude!.toDouble(),
      );

      final distance = _calculateDistanceBetweenCoordinatesCase(
        startLatLng,
        endLatLng,
      );

      info = await _calculateCase(
        start: start,
        end: end,
        roadWidth: _part.roadWidth!,
        rainVolume: _project.rainVolume!,
        soilType: _project.soilType!,
        distance: distance,
      );

      state = StateItem.none;
      return true;
    } catch (e) {
      info = null;
      state = StateItem.calculate;
      ToastService.show('Houve um problema ao calcular o trecho.');
      return false;
    }
  }
}
