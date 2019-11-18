import 'package:eskool/Models/materiasModel.dart';
import 'package:flutter/material.dart';
import 'package:eskool/Blocs/Bloc Materias/materia_bloc.dart';

final materiaBloc = MateriaBloc();
class CreateMateria extends StatelessWidget {
  @override
  final materiaController = TextEditingController();

  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
          title: Text('Asignaturas'),
        ),
        body:
        Container(

          //margin: EdgeInsets.all(50.0),
          //padding: EdgeInsets.all(100.0),
          child: Column(
            children: <Widget>[
              //SizedBox(height: 70.0,),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20.0),
                  labelText: 'Materia',
                ),
                controller: materiaController,
              ),
//              TextFormField(
//                decoration: InputDecoration(
//                  contentPadding: EdgeInsets.all(20.0),
//                  labelText: 'Curso',
//                ),
//                controller: cursoController,
//              ),
              SizedBox(height: 20.0,),

              RaisedButton(
                child: Text('Agregar'),
                onPressed: () {
                  materiaBloc.addMateria(MateriasModel(nombre: materiaController.text));
                  //cursoBloc.addCurso(CursoModel(nombre: cursoController.text));

                },
              ),
            ],
          ),
        ),
      ),

    );
  }
}
