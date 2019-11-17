import 'package:eskool/Models/cursoModel.dart';
import 'package:eskool/DataBase/db_conexion.dart';




class CursoProvider extends DBConexion{
  static final CursoProvider db = CursoProvider();

  Future<int> addCurso(CursoModel cursos) async{
    final db =  await database;
    final cursosId = await db.insert('materias', cursos.toMap());
    return cursosId;
  }

  Future<List<CursoModel>> listCursos() async{
    final db = await database;
    final results = await db.query('curso');

    List<CursoModel> curso = results.isNotEmpty? results.map((curso)
    => CursoModel.fromMap(curso)).toList():[];
    return curso;


  }
}

