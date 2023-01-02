import 'package:dartz/dartz.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/poster_model.dart';

class DatabaseHelper {
  //singleTon pattern
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper.internal();
  static late Database dataBase;

  Future<Database> createDatabase() async {
    if (dataBase != null) {
      return dataBase;
    }
    String path = join(await getDatabasesPath(), 'poster.db');

    dataBase = await openDatabase(path, version: 1, onCreate: initDb);
    return dataBase;
  }

// createTable
  initDb(Database db, int version) {
    db.execute('''
   create table $tableName($columnId integer not null primary key,
   $columnSerialNumber integer not null,
   $columnNumberPlates text not null,
   )
   ''');
  }

  //insert into table
  Future<int> insertPoster(PosterModel posterModel) async {
    Database db = await createDatabase();
    return await db.insert(tableName, posterModel.toJson());
  }

// query for table
  Future<List<PosterModel>> getPoser() async {
    Database db = await createDatabase();
    List<Map<String, dynamic>> mabs = await db.query(tableName);
    // Convert the List<Map<String, dynamic> into a List<PosterModel>.
    return List.generate(mabs.length, (index) {
      return PosterModel(
          numberPlates: mabs[index]['numberPlates'],
          serialNumber: mabs[index]['serialNumber'],
          id: mabs[index]['id']);
    });
  }

//delete table
  Future<int> deletePoster(int id) async {
    Database db = await createDatabase();
    return await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  // update column
  Future<void> updatePoster(PosterModel posterModel) async {
    Database db = await createDatabase();
    await db.update(tableName, posterModel.toJson(),
        where: 'id = ?', whereArgs: [posterModel.id]);
  }
}
