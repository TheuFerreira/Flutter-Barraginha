import 'package:flutter_barraginha/app/shared/models/soil_type_model.dart';
import 'package:intl/intl.dart';

class ProjectModel {
  int? id;
  String title;
  DateTime date;
  double rainVolume;
  late SoilTypeModel soilType;
  int? parts;

  ProjectModel(this.title, this.date, this.rainVolume, this.soilType);

  ProjectModel.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        date = DateTime.parse(map['date']),
        rainVolume = map['rain_volume'],
        parts = map['parts'],
        soilType = map['soil_type'] as SoilTypeModel;

  Map<String, dynamic> toMap() => {
        "id": id,
        'id_soil_type': soilType.id,
        "title": title,
        "date": DateFormat('yyyy-MM-dd hh:mm:ss').format(date),
        "rain_volume": rainVolume,
      };

  String getShortDate() {
    return DateFormat('dd/MM/yyyy').format(date);
  }
}
