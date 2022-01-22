import 'package:flutter_barraginha/app/screens/map/models/responses/map_response.dart';
import 'package:flutter_barraginha/app/shared/database/connection.dart';

class SavePartUsecases extends Connection {
  Future save(MapResponse map) async {
    if (map.idPart == null) {
      await _add(map);
    } else {
      await _update(map);
    }
  }

  Future _add(MapResponse map) async {
    final db = await getDatabase();
    await db.transaction((txn) async {
      final id = await txn.insert(
        'part',
        {
          'id_project': map.idProject,
          'road_width': map.roadWidth,
        },
      );
      await txn.insert('point', {
        'id_part': id,
        'latitude': map.coordinate1!.latitude,
        'longitude': map.coordinate1!.longitude,
        'altitude': map.coordinate1!.altitude,
      });
      await txn.insert('point', {
        'id_part': id,
        'latitude': map.coordinate2!.latitude,
        'longitude': map.coordinate2!.longitude,
        'altitude': map.coordinate2!.altitude,
      });
    });
  }

  Future _update(MapResponse map) async {
    final db = await getDatabase();
    await db.transaction((txn) async {
      await txn.rawUpdate(
        'UPDATE part SET road_width = ? WHERE id = ?;',
        [
          map.roadWidth,
          map.idPart,
        ],
      );
      await txn.rawUpdate(
        'UPDATE point SET latitude = ?, longitude = ?, altitude = ? WHERE id = ?;',
        [
          map.coordinate1!.latitude,
          map.coordinate1!.longitude,
          map.coordinate1!.altitude,
          map.coordinate1!.id,
        ],
      );
      await txn.rawUpdate(
        'UPDATE point SET latitude = ?, longitude = ?, altitude = ? WHERE id = ?;',
        [
          map.coordinate2!.latitude,
          map.coordinate2!.longitude,
          map.coordinate2!.altitude,
          map.coordinate2!.id,
        ],
      );
    });
  }
}
