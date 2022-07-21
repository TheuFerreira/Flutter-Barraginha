import 'dart:developer';

import 'package:geolocator/geolocator.dart';

abstract class IGeolocationService {
  Future<bool> isLocationEnabled();
  void enableLocation();
  Future<Position?> getCurrentLocation();
}

class GeolocatorService implements IGeolocationService {
  @override
  Future<bool> isLocationEnabled() async {
    final result = await Geolocator.isLocationServiceEnabled();
    return result;
  }

  @override
  void enableLocation() async {
    await Geolocator.openLocationSettings();
  }

  @override
  Future<Position?> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.denied ||
          permission == LocationPermission.whileInUse) {
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
