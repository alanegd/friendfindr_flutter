import 'package:friendfindr_flutter/database/app_database.dart';
import 'package:friendfindr_flutter/models/person.dart';
import 'package:sqflite/sqlite_api.dart';

class PersonDao {
  insert(Person person) async {
    person.isFavorite = true;
    Database db = await AppDatabase().openDb();
    print('Inserting person: ${person.toMap()}');
    await db.insert(AppDatabase().tableName, person.toMap());
  }

  delete(Person person) async {
    Database db = await AppDatabase().openDb();
    print('Deleting person: ${person.id}');
    await db.delete(AppDatabase().tableName,
        where: "id = ?", whereArgs: [person.id]);
  }

  Future<bool> isFavorite(Person person) async {
    Database db = await AppDatabase().openDb();
    List maps = await db.query(AppDatabase().tableName,
        where: "id = ?", whereArgs: [person.id]);

    print('Checking if person is favorite: ${maps.isNotEmpty}');
    return maps.isNotEmpty;
  }

  Future<List<Person>> getAll() async {
    Database db = await AppDatabase().openDb();
    List maps = await db.query(AppDatabase().tableName);
    print('Fetched all people: $maps');
    return maps.map((map) => Person.fromMap(map)).toList();
  }
}
