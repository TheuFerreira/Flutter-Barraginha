import 'package:flutter_barraginha/app/screens/parts/models/responses/project_part_response.dart';
import 'package:flutter_barraginha/app/shared/database/connection.dart';

class GetProjectPartUseCase extends Connection {
  Future<ProjectPartResponse> getProjectPart(int idProject) async {
    final db = await getDatabase();
    final result = await db.rawQuery(
      'SELECT p.id, p.title, p.rain_volume, COUNT(pt.id) AS parts '
      'FROM project AS p '
      'LEFT JOIN part AS pt ON pt.id_project = p.id '
      'WHERE p.id = ?',
      [idProject],
    );

    return ProjectPartResponse.fromMap(result[0]);
  }
}
