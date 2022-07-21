import 'package:flutter_barraginha/domain/entities/point.dart';

class Part {
  int? id;
  int? idProject;
  num? roadWidth;
  int? status;
  late List<Point> points = [];

  Part({
    this.id,
    this.idProject,
    this.roadWidth,
    this.status,
  });
}
