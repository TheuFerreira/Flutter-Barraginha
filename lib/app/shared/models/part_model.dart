import 'package:flutter_barraginha/app/shared/models/point_model.dart';

class PartModel {
  final int id;
  final double? roadWidth;
  final List<PointModel> points;

  const PartModel(this.id, this.roadWidth, this.points);
}
