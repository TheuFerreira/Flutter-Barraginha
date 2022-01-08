import 'dart:async';
import 'package:sqflite/sqflite.dart';

abstract class Connection {
  Future<Database> getDatabase() async {
    String defaultPath = await getDatabasesPath();
    String dbPath = defaultPath + '/video_cut.db';
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
      },
    );
  }
}

const String sqlProject = ''
    'CREATE TABLE project ('
    'id          INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, '
    'title       TEXT NOT NULL, '
    'date        DATETIME NOT NULL, '
    'rain_volume INTEGER NOT NULL, '
    'status      BOOLEAN NOT NULL DEFAULT (1)'
    ');';
