import 'package:flutter_barraginha/app/shared/database/connection.dart';
import 'package:flutter_barraginha/app/shared/database/responses/display_part.dart';
import 'package:flutter_barraginha/app/shared/database/responses/display_point.dart';

abstract class IPartRepository {
  Future<List<DisplayPart>> getAll(int idProject);
}

class PartRepository extends Connection implements IPartRepository {
  @override
  Future<List<DisplayPart>> getAll(int idProject) async {
    final db = await getDatabase();
    final result = await db.transaction<List<DisplayPart>>((txn) async {
      final result = await txn.rawQuery(
        'SELECT p.id, p.road_width '
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
          [part['id']],
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
}
