import 'package:flutter_barraginha/domain/services/api_service.dart';

abstract class GetAltitudeByCoordinateCase {
  Future<num> call(
    num? altitude,
    double latitude,
    double longitude,
  );
}

class GetAltitudeByCoordinateCaseImpl implements GetAltitudeByCoordinateCase {
  final APIService _apiService;

  GetAltitudeByCoordinateCaseImpl(this._apiService);

  @override
  Future<num> call(num? altitude, double latitude, double longitude) async {
    if (altitude != null) {
      return altitude.toDouble();
    }

    final value = await _apiService.getAltitude(latitude, longitude);
    return value!;
  }
}
