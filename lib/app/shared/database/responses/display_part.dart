import 'package:flutter_barraginha/app/shared/database/entities/part.dart';

class DisplayPart extends Part {
  DisplayPart.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    roadWidth = map['road_width'];
    status = map['status'];
    points = [];
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'road_width': roadWidth,
        'status': status,
      };
}
