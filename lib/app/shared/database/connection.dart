import 'dart:async';
import 'package:sqflite/sqflite.dart';

abstract class Connection {
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

const String sqlProject = ''
    'CREATE TABLE project ('
    'id           INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, '
    'id_soil_type DECIMAL  NOT NULL, '
    'title        TEXT     NOT NULL, '
    'date         DATETIME NOT NULL, '
    'rain_volume  DECIMAL  NOT NULL, '
    'status       BOOLEAN  NOT NULL DEFAULT (1)'
    ');';

const String sqlPart = ''
    'CREATE TABLE part ( '
    'id         INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, '
    'id_project INTEGER REFERENCES project (id) NOT NULL, '
    'road_width DECIMAL, '
    'status     BOOLEAN DEFAULT (1) NOT NULL '
    ');';

const String sqlPoint = ''
    'CREATE TABLE point ( '
    'id        INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, '
    'id_part   INTEGER REFERENCES part (id) NOT NULL, '
    'latitude  NUMERIC NOT NULL, '
    'longitude NUMERIC NOT NULL, '
    'altitude  NUMERIC '
    ');';
