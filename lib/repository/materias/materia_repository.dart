

import 'package:eskool/models/materiasModel.dart';
import 'package:eskool/providers/db_providers.dart';
import 'package:eskool/repository/materias/repository.dart';

class MateriaRepository implements Repository<MateriasModel>{
  final provider = MateriasProvider.db;

  @override
  Future<List<MateriasModel>> list() {
    // TODO: implement list
    return provider.list();
  }

  @override
  Future<void> add(MateriasModel materia) {
    // TODO: implement add
    return provider.add(materia);
  }
}