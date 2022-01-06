import 'package:intl/intl.dart';

class GroupModel {
  String title;
  DateTime date;
  int parts;

  GroupModel(this.title, this.date, this.parts);

  String getShortDate() {
    return DateFormat('dd/MM/yyyy').format(date);
  }
}
