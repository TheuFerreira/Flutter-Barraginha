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

List<GroupModel> groups = [
  GroupModel('Fazenda do Crocodilo', DateTime(2021, 5, 13), 20),
  GroupModel('Avenida de SJE', DateTime(2020, 12, 20), 10),
  GroupModel('Rua do Paulão', DateTime(2022, 01, 01), 5),
  GroupModel('Fazenda Jão Kisse', DateTime(2020, 09, 17), 17),
  GroupModel('Rua da Igreja', DateTime(2022, 02, 28), 2),
];
