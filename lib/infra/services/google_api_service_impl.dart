import 'package:dio/dio.dart';
import 'package:flutter_barraginha/domain/services/api_service.dart';
import 'package:flutter_barraginha/infra/utils/api.dart';

class GoogleAPIServiceImpl implements APIService {
  @override
  Future<double?> getAltitude(double latitude, double longitude) async {
    final result = await Dio().get(
      'https://maps.googleapis.com/maps/api/elevation/json'
      '?locations=$latitude%2C$longitude'
      '&key=$apiKey',
    );

    final listResult = result.data["results"] as List<dynamic>;
    final res = listResult[0] as Map<String, dynamic>;
    double elevation = res["elevation"] as double;

    return elevation;
  }
}
