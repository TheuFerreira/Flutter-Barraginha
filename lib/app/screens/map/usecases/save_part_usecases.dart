import 'package:flutter_barraginha/app/screens/map/models/responses/map_response.dart';
import 'package:flutter_barraginha/app/shared/database/connection.dart';

class SavePartUsecases extends Connection {
  void save(MapResponse map) {
    if (map.idPart == null) {
      _add(map);
    } else {
      _update(map);
    }
  }

  void _add(MapResponse map) async {
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

  void _update(MapResponse map) async {
    final db = await getDatabase();
    await db.transaction((txn) async {
      // TODO: Update Map
    });
  }
}
