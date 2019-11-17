import 'package:eskool/Models/cursoModel.dart';
import 'package:eskool/DataBase/db_conexion.dart';

class CursoProvider extends DBConexion{
  static final CursoProvider db = CursoProvider();

  Future<int> addCurso(CursoModel curso) async{
    final db =  await database;
    final cursoId = await db.insert('curso', curso.toMap());
    return cursoId;
  }

  Future<List<CursoModel>> listCurso() async{
    final db = await database;
    final results = await db.query('curso');

    List<CursoModel> curso = results.isNotEmpty ? results.map((curso) => CursoModel.fromMap(curso))
        .toList()
        : [];
    return curso;


  }
}

