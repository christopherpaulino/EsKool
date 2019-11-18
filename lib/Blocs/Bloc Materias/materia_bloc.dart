import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:eskool/Repository/materias/repository.dart';
import 'package:meta/meta.dart';
import 'package:eskool/Models/materiasModel.dart';
import 'package:eskool/Repository/materias/materia_repository.dart';

part 'materia_events.dart';
part 'materia_state.dart';

class MateriaBloc{
  static final MateriaBloc _singleton = MateriaBloc._();
  final Repository _matetiaRepository = MateriaRepository();
  final _materiaBroadcast = StreamController<List<MateriasModel>>.broadcast();

  factory MateriaBloc(){
    return _singleton;
  }
  MateriaBloc._(){
    listMateria();
  }

  Stream<List<MateriasModel>> get materiaStrem => _materiaBroadcast.stream;
  listMateria() async{
    _materiaBroadcast.sink.add(await _matetiaRepository.list());
  }

  addMateria(MateriasModel materia) async{
    await _matetiaRepository.add(materia);
    listMateria();
  }

  dispose(){
    _materiaBroadcast?.close();
  }
}