import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:eskool/models/cursoModel.dart';
import 'package:eskool/repository/curso/curso_repository.dart';
import 'package:eskool/repository/curso/repository.dart';
import 'package:meta/meta.dart';

part 'curso_events.dart';
part 'curso_state.dart';

class CursoBloc{

  static final CursoBloc _singleton = CursoBloc._();
  final Respository _cursoRespository = CursoRepository();
  final _cursoBroadcast = StreamController<List<CursoModel>>.broadcast();

  factory CursoBloc(){
    return _singleton;
  }

  CursoBloc._(){
    listCurso();
  }

  Stream<List<CursoModel>> get cursoStream => _cursoBroadcast.stream;
  listCurso() async {
    _cursoBroadcast.sink.add( await _cursoRespository.list());
  }

  addCurso(CursoModel curso) async {
    await _cursoRespository.add(curso);
    listCurso();
  }
  updateCurso(CursoModel curso) async {
    await _cursoRespository.update(curso);
    listCurso();
  }

    dispose(){
    _cursoBroadcast?.close();
  }

}

