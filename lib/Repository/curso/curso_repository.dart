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
/* Cuando creas lo demás metodos o puedes descomentar y implementar el respository completo
  @override
  Future<void> delete(int id) {
    return provider.deleteIngresoById(id);
  }

  @override
  Future<void> update(CursoModel ingreso) {
    return provider.updateIngreso(ingreso);
  }

  @override
  Future<List<CursoModel>> search(int mes) {
    return provider.searchIngresoMes(mes);
  }*/
}

