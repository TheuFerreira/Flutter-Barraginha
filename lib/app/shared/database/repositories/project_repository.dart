import 'package:flutter_barraginha/app/shared/database/connection.dart';
import 'package:flutter_barraginha/app/shared/database/responses/display_project_response.dart';

abstract class IProjectRepository {
  Future<DisplayProjectResponse> getById(int id);
}

class ProjectRepository extends Connection implements IProjectRepository {
  @override
  Future<DisplayProjectResponse> getById(int id) async {
    final db = await getDatabase();
    final result = await db.rawQuery(
      'SELECT p.id, p.id_soil_type, p.title, p.date, p.rain_volume, p.status, COUNT(pt.id) AS parts '
      'FROM project AS p '
      'LEFT JOIN (SELECT id, id_project FROM part WHERE status = 1) AS pt ON pt.id_project = p.id '
      'WHERE p.status = 1 AND p.id = ? '
      'GROUP BY p.id'
      ';',
      [id],
    );

    DisplayProjectResponse projects = DisplayProjectResponse.fromMap(result[0]);
    return projects;
  }
}
