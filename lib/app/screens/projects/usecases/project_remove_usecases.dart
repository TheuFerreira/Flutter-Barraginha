import 'package:flutter_barraginha/app/screens/projects/models/responses/project_list_response.dart';
import 'package:flutter_barraginha/app/shared/database/connection.dart';

class ProjectRemoveUsecases extends Connection {
  Future delete(ProjectListResponse project) async {
    final db = await getDatabase();
    return await db.transaction<int>((txn) async {
      return await txn.rawUpdate(
        'UPDATE project '
        'SET status = 0 '
        'WHERE id = ?;',
        [project.id],
      );
    });
  }
}
