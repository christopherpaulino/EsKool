import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DBConexion{
  static Database _database;
  static final DBConexion db = DBConexion._private();

  DBConexion._private();

  Future<Database> get database async{
    if(_database != null) return _database;

    _database = await initDataBase();
    return _database;
  }

  initDataBase() async {
    Directory appDirectory = await getApplicationDocumentsDirectory();
    final String path = join(appDirectory.path, 'eskool.db');

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db){},
      onCreate:(Database db, int version) async{
        await db.execute('CREATE TABLE materias(id INTEGER PRIMARY KEY AUTOINCREMENT,'
            ' nombre VARCHAR NOT NULL)');
        await db.execute('CREATE TABLE curso(id INTEGER PRIMARY KEY AUTOINCREMENT,'
            ' nombre VARCHAR NOT NULL)');

      },
    );
  }
}