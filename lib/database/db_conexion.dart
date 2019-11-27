import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DBConexion{
  static Database _database;
  static final DBConexion db = DBConexion();



  DBConexion();

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
      version: 2,
      onOpen: (db){},
      onCreate:(Database db, int version) async{
        await db.execute('CREATE TABLE materias(materia_id INTEGER PRIMARY KEY AUTOINCREMENT,'
            ' nombre VARCHAR NOT NULL)');
        await db.execute('CREATE TABLE curso(id INTEGER PRIMARY KEY AUTOINCREMENT,'
            ' grado VARCHAR NOT NULL,'
            ' centro VARCHAR NOT NULL)');
//        await db.execute('CREATE TABLE estudiante(estudiante_id INTEGER PRIMARY KEY AUTOINCREMET,'
//            ' nombre VARCHAR NOT NULL,'
//            ' madre_nombre VARCHAR,'
//            ' madre_tel VARCHAR,'
//            ' madre_email VARCHAR,'
//            ' padre_nombre VARCHAR,'
//            ' padre_tel VARCHAR,'
//            ' padre_email VARCHAR'
//            ' curso_id INTEGER,'
//            ' materia_id INTEGER)');
      },
    );
  }
}