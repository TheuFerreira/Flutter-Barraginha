import 'dart:math';

import 'package:flutter_barraginha/app/shared/services/geolocator_service.dart';
import 'package:flutter_barraginha/app/shared/services/google_earth_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CalculatorService {
  static Future<Map<String, dynamic>> calculate({
    required LatLng start,
    required LatLng end,
    required double soilType,
    required double roadWidth,
    required double rainVolume,
  }) async {
    double? altitudeA = await GoogleEarthService.getAltitude(start);
    double? altitudeB = await GoogleEarthService.getAltitude(end);
    final distance = GeolocatorService.getDistanceBetweenTwoPoints(start, end);

    final levelDifference = (altitudeA! - altitudeB!).abs();
    final horizontalDifference =
        sqrt(pow(distance, 2) - pow(levelDifference, 2));
    final declivity = (levelDifference * 100) / horizontalDifference;
    final horizontalSpacing = 45.18 * soilType * pow(declivity, -0.42);
    final verticalSpacing = 0.4518 * soilType * pow(declivity, 0.58);
    final barrageNumbers = horizontalDifference / horizontalSpacing;
    final barrageNumbersAdjusted = barrageNumbers.round();
    final spacing = distance / barrageNumbersAdjusted;
    final runoffVolume = spacing * roadWidth * rainVolume;
    final depth = pow((runoffVolume / 6.52), 1 / 3).toDouble();
    final radius = 2.41 * depth;
    final barrageVolume = 3.14 * pow(depth, 2) * (radius - (depth / 3));
    // TODO: ERRORS

    final map = {
      "altitudeA": altitudeA.round(),
      "altitudeB": altitudeB.round(),
      "distance": distance.round(),
      "levelDifference": levelDifference.round(),
      "horizontalDifference": convert(horizontalDifference, decimal: 1),
      "declivity": convert(declivity, decimal: 1),
      "horizontalSpacing": convert(horizontalSpacing, decimal: 1),
      "verticalSpacing": convert(verticalSpacing, decimal: 1),
      "barrageNumbers": convert(barrageNumbers, decimal: 1),
      "barrageNumbersAdjusted": barrageNumbersAdjusted.round(),
      "spacing": convert(spacing, decimal: 1),
      "roadWidth": roadWidth,
      "runoffVolume": convert(runoffVolume, decimal: 1),
      "depth": convert(depth, decimal: 2),
      "radius": convert(radius, decimal: 2),
      "barrageVolume": convert(barrageVolume, decimal: 1),
    };

    return map;
  }

  static num convert(num value, {int decimal = 1}) {
    return num.parse(value.toStringAsFixed(decimal));
  }
}
