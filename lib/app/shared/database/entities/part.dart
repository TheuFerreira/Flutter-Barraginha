import 'package:flutter_barraginha/app/shared/database/entities/point.dart';

class Part {
  int? id;
  num? roadWidth;
  int? status;
  late List<Point> points = [];

  Part({
    this.id,
    this.roadWidth,
    this.status,
  });
}
