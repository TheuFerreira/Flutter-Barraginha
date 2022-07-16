import 'package:sqflite/sqflite.dart';

abstract class DatabaseService {
  Future<Database> getDatabase();
}
