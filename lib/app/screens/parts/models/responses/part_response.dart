import 'package:mobx/mobx.dart';

part 'part_response.g.dart';

class PartResponse = _PartResponseBase with _$PartResponse;

abstract class _PartResponseBase with Store {
  int id;
  CoordinateResponse coordinate1;
  CoordinateResponse coordinate2;
  double? roadWidth;

  @observable
  CalculateResponse? calculateResponse;

  @observable
  StateResponse state = StateResponse.loading;

  _PartResponseBase(
    this.id,
    this.coordinate1,
    this.coordinate2,
    this.roadWidth,
    this.calculateResponse,
  );

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

  CoordinateResponse(this.id, this.latitude, this.longitude, this.altitude);
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
