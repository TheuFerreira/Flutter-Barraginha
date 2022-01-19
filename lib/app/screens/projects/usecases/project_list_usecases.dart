import 'package:flutter_barraginha/app/screens/projects/models/responses/project_list_response.dart';
import 'package:flutter_barraginha/app/shared/database/connection.dart';

class ProjectListUsecases extends Connection {
  Future<List<ProjectListResponse>> search({String search = ''}) async {
    final db = await getDatabase();
    final result = await db.rawQuery(
      'SELECT p.id, p.title, p.date, COUNT(pt.id) AS parts '
              'FROM project AS p '
              'LEFT JOIN part AS pt ON pt.id_project = p.id '
              'WHERE p.status = 1 AND title LIKE \'%' +
          search +
          '%\' '
              'GROUP BY p.id '
              ';',
    );

    List<ProjectListResponse> projects = [];
    for (Map<String, dynamic> map in result) {
      final project = ProjectListResponse.fromMap(map);
      projects.add(project);
    }

    return projects;
  }
}
