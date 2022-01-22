import 'package:flutter_barraginha/app/screens/parts/models/responses/part_response.dart';
import 'package:flutter_barraginha/app/shared/database/connection.dart';

class GetPartsUsecases extends Connection {
  Future<List<PartResponse>> getAll(int idProject) async {
    final db = await getDatabase();
    final result = await db.transaction<List<PartResponse>>((txn) async {
      final listPartMap = await txn.rawQuery(
        'SELECT id, road_width FROM part WHERE status = 1 AND id_project = ?;',
        [idProject],
      );

      List<PartResponse> parts = [];
      for (Map<String, dynamic> partMap in listPartMap) {
        final idPart = partMap['id'] as int;
        final roadWidth = partMap['road_width'] as num?;

        final listPointMap = await txn.rawQuery(
          'SELECT id, latitude, longitude, altitude FROM point WHERE id_part = ?',
          [idPart],
        );

        final pointMap1 = listPointMap[0];
        final pointMap2 = listPointMap[1];

        final coordinate1 = _convertMapToCoordinate(pointMap1);
        final coordinate2 = _convertMapToCoordinate(pointMap2);

        final part = PartResponse(
          id: idPart,
          roadWidth: roadWidth,
          coordinate1: coordinate1,
          coordinate2: coordinate2,
        );

        parts.add(part);
      }

      return parts;
    });

    return result;
  }

  _convertMapToCoordinate(Map<String, dynamic> map) {
    return CoordinateResponse(
      id: map['id'] as int,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      altitude: map['altitude'] as double?,
    );
  }
}
