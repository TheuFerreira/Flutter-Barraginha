import 'package:flutter_barraginha/app/shared/database/entities/part.dart';

class DisplayPart extends Part {
  DisplayPart({int idProject = -1}) : super(idProject: idProject) {
    id = null;
    roadWidth = 0;
    points = [];
    status = 1;
  }

  DisplayPart.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    idProject = map['id_project'];
    roadWidth = map['road_width'];
    status = map['status'];
    points = [];
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'id_project': idProject,
        'road_width': roadWidth,
        'status': status,
      };
}
