import 'package:dio/dio.dart';
import 'package:flutter_barraginha/app/shared/exceptions/web_exception.dart';

class GoogleEarthService {
  static const String apiKey = "AIzaSyAZRoDWh96dBHe6k5ud0lQBm4nRdk5gHNA";
  static Future<double?> getAltitude(double latitude, double longitude) async {
    try {
      final result = await Dio().get(
        'https://maps.googleapis.com/maps/api/elevation/json'
        '?locations=$latitude%2C$longitude'
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
