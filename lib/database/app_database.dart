import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  final int version = 1;
  final String databaseName = "friendfindr.db";
  final String tableName = "people";
  Database? db;

  Future<Database> openDb() async {
    db ??= await openDatabase(
      join(await getDatabasesPath(), databaseName),
      version: version,
      onCreate: (db, version) {
        String query =
            "create table $tableName (id text primary key, title text, first text, last text, email text, cell text, gender text, city text, thumbnail text, isFavorite BOOLEAN)";

        db.execute(query);
      },
    );
    return db as Database;
  }
}
