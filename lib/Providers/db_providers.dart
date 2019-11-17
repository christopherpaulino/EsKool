import 'package:eskool/Models/cursoModel.dart';
import 'package:eskool/DataBase/db_conexion.dart';

class CursoPrivider extends DBConexion{
  static final CursoPrivider db = CursoPrivider();

  Future<int> addCurso(CursoModel curso) async{
    final db =  await database;
    final cursoId = await db.insert('eskool', curso.toMap());
    return cursoId;
  }
}

