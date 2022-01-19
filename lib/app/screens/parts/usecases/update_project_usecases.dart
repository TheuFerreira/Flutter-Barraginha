import 'package:flutter_barraginha/app/screens/parts/models/responses/project_part_response.dart';
import 'package:flutter_barraginha/app/shared/database/connection.dart';

class UpdateProjectUsecases extends Connection {
  Future<ProjectPartResponse> update(ProjectPartResponse project) async {
    final db = await getDatabase();

    final values = project.toMap();

    await db.transaction((txn) async {
      await txn.update(
        'project',
        values,
        where: 'id = ?',
        whereArgs: [project.id],
      );
    });

    return project;
  }
}
