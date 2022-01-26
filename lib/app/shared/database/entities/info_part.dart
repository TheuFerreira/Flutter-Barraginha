import 'package:flutter_barraginha/app/shared/database/entities/point.dart';

class InfoPart {
  Point pointA;
  Point pointB;
  num distance;
  num levelDifference;
  num horizontalDifference;
  num declivity;
  num horizontalSpacing;
  num verticalSpacing;
  num barrageNumbers;
  num barrageNumbersAdjusted;
  num spacing;
  num roadWidth;
  num runoffVolume;
  num depth;
  num radius;
  num barrageVolume;

  InfoPart({
    required this.pointA,
    required this.pointB,
    required this.distance,
    required this.levelDifference,
    required this.horizontalDifference,
    required this.declivity,
    required this.horizontalSpacing,
    required this.verticalSpacing,
    required this.barrageNumbers,
    required this.barrageNumbersAdjusted,
    required this.spacing,
    required this.roadWidth,
    required this.runoffVolume,
    required this.depth,
    required this.radius,
    required this.barrageVolume,
  });
}
