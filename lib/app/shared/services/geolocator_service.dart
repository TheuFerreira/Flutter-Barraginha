import 'dart:developer';

import 'package:geolocator/geolocator.dart';

class GeolocatorService {
  // TODO: Exceptions
  Future<Position?> getCurrentLocation() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      log('Location services are disabled.');
      return null;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        log('Location permissions are denied.');
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      log('Location permissions are permanently denied, we canoot request permissions.');
      return null;
    }

    return await Geolocator.getCurrentPosition();
  }
}
