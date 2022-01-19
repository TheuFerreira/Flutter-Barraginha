import 'package:intl/intl.dart';

class ProjectListResponse {
  int id;
  String title;
  DateTime date;
  int parts;

  ProjectListResponse.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        date = DateTime.parse(map['date']),
        parts = map['parts'];

  String getShortDate() => DateFormat('dd/MM/yyyy').format(date);
}
