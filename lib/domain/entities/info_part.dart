import 'package:flutter_barraginha/domain/entities/point.dart';
import 'package:flutter_barraginha/domain/entities/soil_type.dart';

class InfoPart {
  Point pointA;
  Point pointB;
  SoilType soilType;
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
    required this.soilType,
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

  @override
  bool operator ==(other) =>
      (other is InfoPart) &&
      other.pointA == pointA &&
      other.pointB == pointB &&
      other.distance == distance &&
      other.levelDifference == levelDifference &&
      other.horizontalDifference == horizontalDifference &&
      other.declivity == declivity &&
      other.horizontalSpacing == horizontalSpacing &&
      other.verticalSpacing == verticalSpacing &&
      other.barrageNumbers == barrageNumbers &&
      other.barrageNumbersAdjusted == barrageNumbersAdjusted &&
      other.spacing == spacing &&
      other.roadWidth == roadWidth &&
      other.runoffVolume == runoffVolume;

  @override
  int get hashCode => barrageVolume.hashCode;

  @override
  String toString() =>
      "{Point A: $pointA | Point B: $pointB | Soil Type: $soilType | Distance: $distance | Level Difference: $levelDifference | Horizontal Difference: $horizontalDifference | Declivity: $declivity | Horizontal Spacing: $horizontalSpacing | Vertical Spacing: $verticalSpacing | Barrage Numbers: $barrageNumbers | Barrage Numbers Adjusted: $barrageNumbersAdjusted | Spacing: $spacing | Road Width: $roadWidth | Runoff Volume: $runoffVolume | Depth: $depth | Radius: $radius | Barrage Volume: $barrageVolume}";
}
