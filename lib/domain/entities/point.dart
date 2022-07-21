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

  @override
  bool operator ==(other) =>
      (other is Point) &&
      other.id == id &&
      other.latitude == latitude &&
      other.longitude == longitude &&
      other.altitude == altitude;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() =>
      "{Id: $id | Latitude: $latitude | Longitude: $longitude | Altitude: $altitude}";
}
