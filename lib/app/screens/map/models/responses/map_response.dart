class MapResponse {
  int idProject;
  int? idPart;
  double roadWidth;
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

class CoordinateResponse {
  int? id;
  double latitude;
  double longitude;
  double? altitude;

  CoordinateResponse({
    this.id,
    required this.latitude,
    required this.longitude,
    this.altitude,
  });
}
