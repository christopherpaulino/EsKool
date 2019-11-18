import 'package:eskool/Models/cursoModel.dart';
import 'package:eskool/Repository/materias/repository.dart';
import 'package:eskool/Providers/db_providers.dart';
import 'package:eskool/Models/materiasModel.dart';

class MateriaRepository implements Repository<MateriasModel>{
  final provider = MateriasProvider.db;

  @override
  Future<List<MateriasModel>> list() {
    // TODO: implement list
    return provider.list();
  }

  @override
  Future<void> add(MateriasModel materia) {
    // TODO: implement addm
    return provider.add(materia);
  }
}