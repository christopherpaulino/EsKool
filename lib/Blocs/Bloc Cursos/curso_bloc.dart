import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:eskool/Repository/repository.dart';
import 'package:meta/meta.dart';
import 'package:eskool/Models/cursoModel.dart';
import 'package:eskool/Repository/curso_repository.dart';


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

  dispose(){
    _cursoBroadcast?.close();
  }

}

