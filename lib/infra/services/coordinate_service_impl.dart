import 'package:flutter_barraginha/domain/services/coordinate_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CoordinateServiceImpl implements CoordinateService {
  @override
  double distanceBetweenTwoCoordinates(LatLng start, LatLng end) {
    double value = Geolocator.distanceBetween(
      start.latitude,
      start.longitude,
      end.latitude,
      end.longitude,
    );
    return value;
  }
}
