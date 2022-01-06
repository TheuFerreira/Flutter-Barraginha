import 'package:intl/intl.dart';

class ProjectModel {
  int? id;
  String title;
  DateTime date;
  int rainVolume;
  int parts;

  ProjectModel(this.title, this.date, this.rainVolume, this.parts, {this.id});

  String getShortDate() {
    return DateFormat('dd/MM/yyyy').format(date);
  }
}
