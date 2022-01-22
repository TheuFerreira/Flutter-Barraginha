import 'package:mobx/mobx.dart';

part 'part_response.g.dart';

class PartResponse = _PartResponseBase with _$PartResponse;

abstract class _PartResponseBase with Store {
  int id;
  CoordinateResponse coordinate1;
  CoordinateResponse coordinate2;
  num? roadWidth;

  @observable
  CalculateResponse? calculateResponse;

  @observable
  StateResponse state = StateResponse.loading;

  _PartResponseBase({
    required this.id,
    required this.coordinate1,
    required this.coordinate2,
    this.roadWidth,
    this.calculateResponse,
  });

  @action
  void changeState(StateResponse newState) {
    state = newState;
  }
}

class CoordinateResponse {
  int? id;
  double latitude;
  double longitude;
  double? altitude;

  CoordinateResponse({
    this.id,
    required this.latitude,
    required this.longitude,
    this.altitude,
  });
}

class CalculateResponse {
  num? distance;
  num? levelDifference;
  num? horizontalDifference;
  num? declivity;
  num? horizontalSpacing;
  num? verticalSpacing;
  num? barrageNumbers;
  num? barrageNumbersAdjusted;
  num? spacing;
  num? runoffVolume;
  num? depth;
  num? radius;
  num? barrageVolume;

  CalculateResponse.fromMap(Map<String, dynamic> map)
      : distance = map['distance'],
        levelDifference = map['levelDifference'],
        horizontalDifference = map['horizontalDifference'],
        declivity = map['declivity'],
        horizontalSpacing = map['horizontalSpacing'],
        verticalSpacing = map['verticalSpacing'],
        barrageNumbers = map['barrageNumbers'],
        barrageNumbersAdjusted = map['barrageNumbersAdjusted'],
        spacing = map['spacing'],
        runoffVolume = map['runoffVolume'],
        depth = map['depth'],
        radius = map['radius'],
        barrageVolume = map['barrageVolume'];
}

enum StateResponse {
  loading,
  none,
  calculate,
}
