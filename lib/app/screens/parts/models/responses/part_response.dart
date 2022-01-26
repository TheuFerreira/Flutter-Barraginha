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
