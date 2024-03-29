import 'package:flutter_barraginha/domain/entities/info_part.dart';
import 'package:flutter_barraginha/domain/entities/point.dart';
import 'package:flutter_barraginha/domain/entities/soil_type.dart';
import 'package:flutter_barraginha/domain/use_cases/calculate_case.dart';
import 'package:flutter_barraginha/infra/utils/soil_types.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final calculateCase = CalculateCaseImpl();

  test('Calculate First Values', () async {
    Point start = Point(
      latitude: 0,
      longitude: 0,
      altitude: 942,
    );
    Point end = Point(
      latitude: 0,
      longitude: 0,
      altitude: 940,
    );
    SoilType soilType = soilTypes[0];
    num roadWidth = 13;
    num rainVolume = 70;
    double distance = 2448.0;

    final expected = InfoPart(
      pointA: start,
      pointB: end,
      soilType: soilType,
      distance: distance,
      levelDifference: 2,
      horizontalDifference: 2448,
      declivity: 0.1,
      horizontalSpacing: 161.7,
      verticalSpacing: 0.1,
      barrageNumbers: 15.1,
      barrageNumbersAdjusted: 15,
      spacing: 161.7,
      roadWidth: roadWidth,
      runoffVolume: 1471.5,
      depth: 6.09,
      radius: 14.67,
      barrageVolume: 1471.70,
    );

    final infoPart = await calculateCase(
      start: start,
      end: end,
      soilType: soilType,
      roadWidth: roadWidth,
      rainVolume: rainVolume,
      distance: distance,
    );

    expect(expected, infoPart);
  });

  test('Calculate Second Values', () async {
    Point start = Point(
      latitude: 0,
      longitude: 0,
      altitude: 948,
    );
    Point end = Point(
      latitude: 0,
      longitude: 0,
      altitude: 944,
    );
    SoilType soilType = soilTypes[0];
    num roadWidth = 13;
    num rainVolume = 70;
    double distance = 715.13;

    final expected = InfoPart(
      pointA: start,
      pointB: end,
      soilType: soilType,
      distance: distance,
      levelDifference: 4,
      horizontalDifference: 715.1,
      declivity: 0.6,
      horizontalSpacing: 72.1,
      verticalSpacing: 0.4,
      barrageNumbers: 9.9,
      barrageNumbersAdjusted: 10,
      spacing: 72.1,
      roadWidth: roadWidth,
      runoffVolume: 656,
      depth: 4.65,
      radius: 11.21,
      barrageVolume: 656,
    );

    final infoPart = await calculateCase(
      start: start,
      end: end,
      soilType: soilType,
      roadWidth: roadWidth,
      rainVolume: rainVolume,
      distance: distance,
    );

    expect(expected, infoPart);
  });

  test('Calculate Third Values', () async {
    Point start = Point(
      latitude: 0,
      longitude: 0,
      altitude: 976,
    );
    Point end = Point(
      latitude: 0,
      longitude: 0,
      altitude: 972,
    );
    SoilType soilType = soilTypes[0];
    num roadWidth = 4;
    num rainVolume = 19.4;
    double distance = 158;

    final expected = InfoPart(
      pointA: start,
      pointB: end,
      soilType: soilType,
      distance: distance,
      levelDifference: 4,
      horizontalDifference: 157.9,
      declivity: 2.5,
      horizontalSpacing: 38.2,
      verticalSpacing: 1,
      barrageNumbers: 4.1,
      barrageNumbersAdjusted: 4,
      spacing: 38.2,
      roadWidth: roadWidth,
      runoffVolume: 29.7,
      depth: 1.52,
      radius: 3.66,
      barrageVolume: 22.8,
    );

    final infoPart = await calculateCase(
      start: start,
      end: end,
      soilType: soilType,
      roadWidth: roadWidth,
      rainVolume: rainVolume,
      distance: distance,
    );

    expect(expected, infoPart);
  });
}
