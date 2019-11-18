import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eskool/Pages/create_Course.dart';
import 'package:meta/meta.dart';
import 'package:eskool/Providers/db_providers.dart';
import 'package:eskool/Models/cursoModel.dart';
import 'package:eskool/Repository/curso_repository.dart';

part 'curso_events.dart';
part 'curso_state.dart';

class CursoBloc{

  static final CursoBloc _singleton = CursoBloc._();
  final CursoRepository _cursoRepository = SqliteCursoRepository();
  final _cursoBroadcast = StreamController<List<CursoModel>>.broadcast();

  factory CursoBloc(){
    return _singleton;
  }

  CursoBloc._(){
    listCurso();
  }

  Stream<List<CursoModel>> get cursoStream => _cursoBroadcast.stream;
  listCurso() async {
    _cursoBroadcast.sink.add( await CursoProvider.db.listCurso());
  }

  createCourse(CursoModel curso) async {
    await _cursoRepository.addCurso(curso);
    listCurso();
  }

  dispose(){
    _cursoBroadcast?.close();
  }

}

