import 'package:intl/intl.dart';

class ProjectModel {
  String title;
  DateTime date;
  int parts;

  ProjectModel(this.title, this.date, this.parts);

  String getShortDate() {
    return DateFormat('dd/MM/yyyy').format(date);
  }
}
