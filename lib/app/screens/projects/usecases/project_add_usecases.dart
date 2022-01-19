import 'package:flutter_barraginha/app/screens/projects/models/requests/project_add_response.dart';
import 'package:flutter_barraginha/app/screens/projects/models/responses/project_list_response.dart';
import 'package:flutter_barraginha/app/shared/database/connection.dart';
import 'package:sqflite/sqflite.dart';

class ProjectAddUsecases extends Connection {
  Future<ProjectListResponse> add(ProjectAddResponse project) async {
    final db = await getDatabase();

    final values = project.toMap();

    final result = await db.transaction<ProjectListResponse>((txn) async {
      final id = await txn.insert('project', values);
      return getById(txn, id);
    });

    return result;
  }

  Future<ProjectListResponse> getById(Transaction txn, int id) async {
    final result = await txn.rawQuery(
      'SELECT p.id, p.title, p.date, COUNT(pt.id) AS parts '
      'FROM project AS p '
      'LEFT JOIN part AS pt ON pt.id_project = p.id '
      'WHERE p.id = ?;',
      [id],
    );

    return ProjectListResponse.fromMap(result[0]);
  }
}
