import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class CoordinateService {
  double distanceBetweenTwoCoordinates(LatLng start, LatLng end);
}
