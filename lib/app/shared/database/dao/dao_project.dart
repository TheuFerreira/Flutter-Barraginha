import 'package:flutter_barraginha/app/shared/database/dao/dao_soil_type.dart';
import 'package:flutter_barraginha/app/shared/models/project_model.dart';
import 'package:flutter_barraginha/app/shared/database/connection.dart';

class DAOProject extends Connection {
  Future<List<ProjectModel>> search({String search = ''}) async {
    final db = await getDatabase();
    final result = await db.rawQuery(
      'SELECT p.id, p.id_soil_type, p.title, p.date, p.rain_volume, COUNT(pt.id) AS parts '
              'FROM project AS p '
              'LEFT JOIN part AS pt ON pt.id_project = p.id '
              'WHERE p.status = 1 AND title LIKE \'%' +
          search +
          '%\' '
              'GROUP BY p.id '
              ';',
    );

    List<ProjectModel> projects = [];
    for (Map<String, dynamic> map in result) {
      int idSoilType = map['id_soil_type'] as int;
      final soilType = DAOSoilType().getById(idSoilType);

      Map<String, dynamic> otherMap = {
        ...map,
        'soil_type': soilType,
      };

      final project = ProjectModel.fromMap(otherMap);
      projects.add(project);
    }

    return projects;
  }

  Future<ProjectModel> save(ProjectModel project) async {
    if (project.id == null) {
      return await _add(project);
    }

    throw Exception();
  }

  Future<ProjectModel> _add(ProjectModel project) async {
    final db = await getDatabase();

    final values = project.toMap();

    project.id = await db.transaction<int>((txn) async {
      final id = await txn.insert('project', values);
      return id;
    });

    return project;
  }

  Future delete(ProjectModel project) async {
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
