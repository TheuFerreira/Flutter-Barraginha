import 'package:flutter_barraginha/domain/entities/display_project_response.dart';
import 'package:flutter_barraginha/domain/repositories/project_repository.dart';
import 'package:flutter_barraginha/domain/services/database_service.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final DatabaseService _databaseService;

  ProjectRepositoryImpl(this._databaseService);

  @override
  Future<DisplayProjectResponse> save(DisplayProjectResponse project) async {
    if (project.id == null) {
      return await _insert(project);
    } else {
      return await _update(project);
    }
  }

  Future<DisplayProjectResponse> _insert(DisplayProjectResponse project) async {
    final db = await _databaseService.getDatabase();

    final values = project.toMap();
    final result = await db.transaction<DisplayProjectResponse>((txn) async {
      project.id = await txn.insert('project', values);
      return project;
    });

    return result;
  }

  Future<DisplayProjectResponse> _update(DisplayProjectResponse project) async {
    final db = await _databaseService.getDatabase();

    await db.transaction((txn) async {
      await txn.update(
        'project',
        project.toMap(),
        where: 'id = ?',
        whereArgs: [project.id],
      );
    });

    return project;
  }

  @override
  Future<List<DisplayProjectResponse>> search({String search = ''}) async {
    final db = await _databaseService.getDatabase();
    final result = await db.rawQuery(
      'SELECT p.id, p.id_soil_type, p.title, p.date, p.rain_volume, p.status, COUNT(pt.id) AS parts '
              'FROM project AS p '
              'LEFT JOIN (SELECT id, id_project FROM part WHERE status = 1) AS pt ON pt.id_project = p.id '
              'WHERE p.status = 1 AND title LIKE \'%' +
          search +
          '%\' '
              'GROUP BY p.id'
              ';',
    );

    List<DisplayProjectResponse> projects = [];
    for (Map<String, dynamic> map in result) {
      final project = DisplayProjectResponse.fromMap(map);
      projects.add(project);
    }

    return projects;
  }

  @override
  Future<DisplayProjectResponse> getById(int id) async {
    final db = await _databaseService.getDatabase();
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
