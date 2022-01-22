import 'package:flutter_barraginha/app/screens/parts/models/responses/part_response.dart';

class MapResponse {
  int idProject;
  int? idPart;
  num? roadWidth;
  num rainVolume;
  CoordinateResponse? coordinate1;
  CoordinateResponse? coordinate2;

  MapResponse({
    required this.idProject,
    this.idPart,
    required this.roadWidth,
    required this.rainVolume,
    this.coordinate1,
    this.coordinate2,
  });
}
