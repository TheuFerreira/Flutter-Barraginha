import 'package:flutter_barraginha/domain/entities/point.dart';

class DisplayPoint extends Point {
  DisplayPoint.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    latitude = map['latitude'];
    longitude = map['longitude'];
    altitude = map['altitude'];
  }
}
