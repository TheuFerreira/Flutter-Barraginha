import 'package:intl/intl.dart';

class ProjectAddResponse {
  final String title;
  final double rainVolume;
  final int idSoilType;
  final DateTime date;

  ProjectAddResponse({
    required this.title,
    required this.rainVolume,
    required this.idSoilType,
    required this.date,
  });

  Map<String, dynamic> toMap() => {
        'id_soil_type': idSoilType,
        "title": title,
        "date": DateFormat('yyyy-MM-dd hh:mm:ss').format(date),
        "rain_volume": rainVolume,
      };
}
