import 'package:flutter_barraginha/domain/services/coordinate_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class CalculateDistanceBetweenCoordinatesCase {
  double call(LatLng start, LatLng end);
}

class CalculateDistanceBetweenCoordinatesCaseImpl
    implements CalculateDistanceBetweenCoordinatesCase {
  final CoordinateService _coordinateService;

  CalculateDistanceBetweenCoordinatesCaseImpl(this._coordinateService);

  @override
  double call(LatLng start, LatLng end) {
    final distance = _coordinateService.distanceBetweenTwoCoordinates(
      start,
      end,
    );

    return distance;
  }
}
