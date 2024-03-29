import 'package:flutter_barraginha/domain/entities/point.dart';
import 'package:flutter_barraginha/domain/entities/display_part.dart';
import 'package:flutter_barraginha/domain/entities/display_point.dart';
import 'package:flutter_barraginha/domain/repositories/part_repository.dart';
import 'package:flutter_barraginha/domain/services/database_service.dart';

class PartRepositoryImpl implements PartRepository {
  final DatabaseService _databaseService;

  PartRepositoryImpl(this._databaseService);

  @override
  Future<List<DisplayPart>> getAll(int idProject) async {
    final db = await _databaseService.getDatabase();
    final result = await db.transaction<List<DisplayPart>>((txn) async {
      final result = await txn.rawQuery(
        'SELECT p.id, p.id_project, p.road_width, p.status '
        'FROM part AS p '
        'WHERE p.status = 1 AND p.id_project = ?',
        [idProject],
      );

      List<DisplayPart> parts = [];
      for (dynamic part in result) {
        final newPart = DisplayPart.fromMap(part);
        final points = await txn.rawQuery(
          'SELECT * '
          'FROM point AS p '
          'WHERE p.id_part = ?',
          [
            part['id'],
          ],
        );

        for (dynamic point in points) {
          final newPoint = DisplayPoint.fromMap(point);
          newPart.points.add(newPoint);
        }

        parts.add(newPart);
      }

      return parts;
    });

    return result;
  }

  @override
  Future save(DisplayPart part) async {
    if (part.id == null) {
      await _insert(part);
    } else {
      await _update(part);
    }
  }

  Future _insert(DisplayPart part) async {
    final db = await _databaseService.getDatabase();

    await db.transaction((txn) async {
      int idPart = await txn.insert(
        'part',
        part.toMap(),
      );

      for (Point point in part.points) {
        await txn.rawInsert(
          'INSERT INTO point (id_part, latitude, longitude, altitude) '
          'VALUES (?, ?, ?, ?);',
          [
            idPart,
            point.latitude,
            point.longitude,
            point.altitude,
          ],
        );
      }
    });
  }

  Future _update(DisplayPart part) async {
    final db = await _databaseService.getDatabase();

    await db.transaction((txn) async {
      await txn.update(
        'part',
        part.toMap(),
        where: 'id = ?',
        whereArgs: [part.id],
      );

      for (Point point in part.points) {
        await txn.rawUpdate(
          'UPDATE point '
          'SET  latitude = ?, longitude = ?, altitude = ? '
          'WHERE id = ?',
          [
            point.latitude,
            point.longitude,
            point.altitude,
            point.id,
          ],
        );
      }
    });
  }
}
