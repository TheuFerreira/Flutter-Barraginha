import 'package:flutter_barraginha/domain/services/database_service.dart';
import 'package:flutter_barraginha/infra/utils/sql_v1.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseServiceImpl implements DatabaseService {
  @override
  Future<Database> getDatabase() async {
    String defaultPath = await getDatabasesPath();
    String dbPath = defaultPath + '/video_cut.db';

    //await deleteDatabase(dbPath);

    final db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: _createDB,
    );
    return db;
  }

  _createDB(Database db, int version) async {
    await db.transaction(
      (txn) async {
        await txn.execute(sqlProject);
        await txn.execute(sqlPart);
        await txn.execute(sqlPoint);
      },
    );
  }
}
