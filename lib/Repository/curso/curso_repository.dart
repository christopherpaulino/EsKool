import 'package:eskool/Blocs/Bloc%20Cursos/curso_bloc.dart';
import 'package:eskool/Models/cursoModel.dart';
import 'package:eskool/Providers/db_providers.dart';
import 'package:eskool/Repository/curso/repository.dart';

 class CursoRepository implements Respository<CursoModel>{
  final provider = CursoProvider.db;
  @override
  Future<List<CursoModel>> list() {
    return provider.list();
  }

  @override
  Future<void> add(CursoModel curso) {
    return provider.add(curso);
  }

  @override
  Future<void> update(CursoModel curso) {
    // TODO: implement update
    return provider.update(curso);
  }

/* Cuando creas lo demás metodos o puedes descomentar y implementar el respository completo
  @override
  Future<void> delete(int id) {
    return provider.deleteIngresoById(id);
  }



  @override
  Future<List<CursoModel>> search(int mes) {
    return provider.searchIngresoMes(mes);
  }*/
}

