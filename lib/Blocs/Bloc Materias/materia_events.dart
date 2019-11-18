part of'materia_bloc.dart';

@immutable
abstract class MateriaEvent extends Equatable{
  const MateriaEvent();

  @override
  List<Object> get props => [];
}

class LoadMateria extends MateriaEvent{}

class AddMateria extends MateriaEvent{
  final MateriasModel materia;

  const AddMateria(this.materia);

  @override
  List<Object> get props =>[materia];
}