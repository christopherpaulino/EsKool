import 'package:eskool/Models/cursoModel.dart';
import 'package:eskool/DataBase/db_conexion.dart';
import 'package:eskool/Models/materiasModel.dart';

//Cursos
class CursoProvider extends DBConexion{
  static final CursoProvider db = CursoProvider();

  Future<int> add(CursoModel curso) async{
    final db =  await database;
    final cursoId = await db.insert('curso', curso.toMap());
    return cursoId;
  }

  Future<List<CursoModel>> list() async{
    final db = await database;
    final results = await db.query('curso');

    List<CursoModel> curso = results.isNotEmpty ? results.map((curso) => CursoModel.fromMap(curso))
        .toList()
        : [];
    return curso;
  }
}

//Materias
class MateriasProvider extends DBConexion{
  static final MateriasProvider db = MateriasProvider();

  Future<int> add(MateriasModel materia) async{
    final db = await database;
    final materiaId = await db.insert('materia', materia.toMap());
    return materiaId;
  }

  Future<List<MateriasModel>> list() async{
    final db = await database;
    final results = await db.query('materias');

    List<MateriasModel> materia = results.isNotEmpty ? results.map((materias) => MateriasModel.fromMap(materias))
        .toList()
        :[];
    return materia;
  }
}
