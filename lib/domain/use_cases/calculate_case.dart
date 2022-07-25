import 'dart:math' as mt;

import 'package:flutter_barraginha/domain/entities/info_part.dart';
import 'package:flutter_barraginha/domain/entities/point.dart';
import 'package:flutter_barraginha/domain/entities/soil_type.dart';

abstract class CalculateCase {
  Future<InfoPart> call({
    required Point start,
    required Point end,
    required SoilType soilType,
    required num roadWidth,
    required num rainVolume,
    required double distance,
  });
}

class CalculateCaseImpl implements CalculateCase {
  @override
  Future<InfoPart> call({
    required Point start,
    required Point end,
    required SoilType soilType,
    required num roadWidth,
    required num rainVolume,
    required double distance,
  }) async {
    final levelDifference = (start.altitude! - end.altitude!).abs();
    final horizontalDifference =
        mt.sqrt(mt.pow(distance, 2) - mt.pow(levelDifference, 2));
    final declivity = (levelDifference * 100) / horizontalDifference;
    final horizontalSpacing =
        45.18 * soilType.value! * mt.pow(declivity, -0.42);
    final verticalSpacing = 0.4518 * soilType.value! * mt.pow(declivity, 0.58);
    final barrageNumbers = horizontalDifference / horizontalSpacing;
    final barrageNumbersAdjusted = barrageNumbers.round();
    final spacing = distance / barrageNumbers;
    final runoffVolume = spacing * roadWidth * (rainVolume / 100);
    final depth = mt.pow((runoffVolume / 6.52), 1 / 3).toDouble();
    final radius = 2.41 * depth;
    final barrageVolume = 3.14 * mt.pow(depth, 2) * (radius - (depth / 3));

    num distanceFormatted = convert(distance, decimal: 2);

    InfoPart info = InfoPart(
      pointA: start,
      pointB: end,
      soilType: soilType,
      distance: distanceFormatted,
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

  num convert(num value, {int decimal = 1}) =>
      num.parse(value.toStringAsFixed(decimal));
}
