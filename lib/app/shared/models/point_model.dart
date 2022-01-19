import 'package:google_maps_flutter/google_maps_flutter.dart';

class PointModel {
  final int id;
  final LatLng position;
  final double? altitude;

  const PointModel(this.id, this.position, this.altitude);
}
