import 'package:intl/intl.dart';

class ProjectModel {
  int? id;
  String title;
  DateTime date;
  int rainVolume;
  int? parts;

  ProjectModel.fromAdd(this.title, this.date, this.rainVolume);

  ProjectModel.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        date = DateTime.parse(map['date']),
        rainVolume = map['rain_volume'],
        parts = map['parts'];

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "date": DateFormat('yyyy-MM-dd hh:mm:ss').format(date),
        "rain_volume": rainVolume,
      };

  String getShortDate() {
    return DateFormat('dd/MM/yyyy').format(date);
  }
}
