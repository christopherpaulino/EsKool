import 'package:eskool/Models/cursoModel.dart';
import 'package:eskool/DataBase/db_conexion.dart';



class CursoPrivider extends DBConexion{
  static final CursoPrivider db = CursoPrivider();

  Future<int> addCurso(CursoModel curso) async{
    final db =  await database;
    final cursoId = await db.insert('materias', curso.toMap());
    return cursoId;
  }

  Future<List<CursoModel>> listCurso() async{
    final db = await database;
    final results = await db.query('materias');

    List<CursoModel> eskool = results.isNotEmpty? results.map((curso)
    => CursoModel.fromMap(curso)).toList():[];
    return eskool;


  }
}

