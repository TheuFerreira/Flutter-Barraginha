import 'package:flutter_barraginha/app/shared/database/entities/info_part.dart';
import 'package:flutter_barraginha/app/shared/database/entities/point.dart';
import 'package:flutter_barraginha/app/shared/database/entities/soil_type.dart';
import 'package:flutter_barraginha/domain/use_cases/calculate_case.dart';
import 'package:flutter_barraginha/infra/utils/soil_types.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final _calculateCase = CalculateCaseImpl();

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
    num rainVolume = 0.7;
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

    final infoPart = await _calculateCase(
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
    num rainVolume = 0.7;
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

    final infoPart = await _calculateCase(
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
