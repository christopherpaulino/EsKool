import 'package:eskool/database/db_conexion.dart';
import 'package:eskool/models/curso_model.dart';
import 'package:eskool/models/materias_model.dart';

class CursoProvider extends DBConexion{
  static final CursoProvider db = CursoProvider();

  Future<int> add(CursoModel curso) async{
    final db =  await database;
    final cursoId = await db.insert('curso', curso.toMap());
    return cursoId;
  }

  Future<int> update(CursoModel curso) async {
    final db = await database;

    final result = await db
        .update('curso', curso.toMap(), where: 'curso_id = ?', whereArgs: [curso.curso_id]);
    return result;
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
    final materiaId = await db.insert('materias', materia.toMap());
    return materiaId;
  }

  Future<List<MateriasModel>> list() async{
    final db = await database;
    final results = await db.query('materias');

    List<MateriasModel> materias = results.isNotEmpty ? results.map((materias) => MateriasModel.fromMap(materias))
        .toList()
        :[];
    return materias;
  }



}
