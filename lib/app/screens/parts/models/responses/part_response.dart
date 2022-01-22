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
  int id;
  double latitude;
  double longitude;
  double? altitude;

  CoordinateResponse({
    required this.id,
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
        levelDifference = map['distance'],
        horizontalDifference = map['distance'],
        declivity = map['distance'],
        horizontalSpacing = map['distance'],
        verticalSpacing = map['distance'],
        barrageNumbers = map['distance'],
        barrageNumbersAdjusted = map['distance'],
        spacing = map['distance'],
        runoffVolume = map['distance'],
        depth = map['distance'],
        radius = map['distance'],
        barrageVolume = map['distance'];
}

enum StateResponse {
  loading,
  none,
  calculate,
}
