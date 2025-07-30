import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  static Database? _database;
  LocalDatabase._internal();

  static final LocalDatabase instance = LocalDatabase._internal();
  static final String tableName = "NOTES";

  Future<Database> getDatabase() async {
    if (_database == null) {
      var dbpath = await getDatabasesPath();
      var database = join(dbpath, "notes.db");
      _database = await openDatabase(
        database,
        onCreate: (db, version) {
          db.execute("""
            CREATE TABLE $tableName (
            ID INTEGER PRIMARY KEY AUTOINCREMENT,
            TITLE TEXT NOT NULL,
            DESCRIPTION TEXT
            )
""");
        },
      );
    }
    return _database!;
  }
}
