import 'package:flutter_barraginha/app/shared/database/entities/project.dart';
import 'package:flutter_barraginha/app/shared/database/entities/soil_type.dart';
import 'package:intl/intl.dart';

class DisplayProjectResponse extends Project {
  int partCount = 0;
  SoilType? soilType;

  DisplayProjectResponse({
    int idSoilType = 1,
    String title = '',
    DateTime? date,
    num? rainVolume,
    int status = 1,
    this.soilType,
  }) : super(
          idSoilType: idSoilType,
          title: title,
          date: date,
          rainVolume: rainVolume,
          status: status,
        );

  DisplayProjectResponse.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    idSoilType = map['id_soil_type'];
    title = map['title'];
    date = DateTime.parse(map['date']);
    rainVolume = map['rain_volume'];
    status = map['status'];

    partCount = map['parts'];
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'id_soil_type': idSoilType,
        'title': title,
        'date': DateFormat('yyyy-MM-dd hh:mm:ss').format(date!),
        'rain_volume': rainVolume,
        'status': status,
      };

  String getShortDate() => DateFormat('dd/MM/yyyy').format(date!);
}
