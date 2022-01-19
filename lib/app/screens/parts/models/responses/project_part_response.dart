class ProjectPartResponse {
  int id;
  String title;
  num rainVolume;
  int parts;

  ProjectPartResponse.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        rainVolume = map['rain_volume'],
        parts = map['parts'];

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "rain_volume": rainVolume,
      };
}
