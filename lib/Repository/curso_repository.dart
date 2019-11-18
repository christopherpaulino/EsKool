import 'package:eskool/Models/cursoModel.dart';
import 'package:eskool/Providers/db_providers.dart';


abstract class CursoRepository{

  Future<void> addCurso(CursoModel curso);
  Future<List<CursoModel>> listCurso();

}

class SqliteCursoRepository implements CursoRepository {

  final provider = CursoProvider.db;

  @override
  Future<List<CursoModel>> listCurso() {
    // TODO: implement listCurso
    return null;
  }

  @override
  Future<void> addCurso(CursoModel curso) {
    // TODO: implement addCurso
    return null;
  }
}

