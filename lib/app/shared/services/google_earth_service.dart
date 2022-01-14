import 'package:dio/dio.dart';
import 'package:flutter_barraginha/app/shared/exceptions/web_exception.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleEarthService {
  static const String apiKey = "AIzaSyAZRoDWh96dBHe6k5ud0lQBm4nRdk5gHNA";
  static Future<double?> getAltitude(LatLng position) async {
    final lat = position.latitude;
    final lng = position.longitude;

    try {
      final result = await Dio().get(
        'https://maps.googleapis.com/maps/api/elevation/json'
        '?locations=$lat%2C$lng'
        '&key=$apiKey',
      );

      final listResult = result.data["results"] as List<dynamic>;
      final res = listResult[0] as Map<String, dynamic>;
      double elevation = res["elevation"] as double;

      return elevation;
    } on DioError {
      throw WebException();
    } on Exception {
      throw Exception();
    }
  }
}
