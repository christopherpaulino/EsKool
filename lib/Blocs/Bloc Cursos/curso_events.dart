part of'curso_bloc.dart';

@immutable
abstract class CursoEvent extends Equatable{
  const CursoEvent();

  @override
  List<Object> get props => [];
}

class LoadCurso extends CursoEvent{}

class AddCurso extends CursoEvent{
  final CursoModel curso;

  const AddCurso(this.curso);

  @override
  List<Object> get props =>[curso];
}