class Point {
  int? id;
  num? latitude;
  num? longitude;
  num? altitude;

  Point({
    this.id,
    this.latitude,
    this.longitude,
    this.altitude,
  });

  Point.copy(Point point) {
    id = point.id;
    latitude = point.latitude;
    longitude = point.longitude;
    altitude = point.altitude;
  }
}
