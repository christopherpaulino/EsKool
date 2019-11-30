

import 'package:eskool/models/materias_model.dart';
import 'package:eskool/providers/db_providers.dart';
import 'package:eskool/repository/materias/repository.dart';

class MateriaRepository implements Repository<MateriasModel>{
  final provider = MateriasProvider.db;

  @override
  Future<List<MateriasModel>> list() {

    return provider.list();
  }

  @override
  Future<void> add(MateriasModel materia) {
    return provider.add(materia);
  }
}