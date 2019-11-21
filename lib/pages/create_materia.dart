import 'package:eskool/blocs/bloc_materias/materia_bloc.dart';
import 'package:eskool/models/materiasModel.dart';
import 'package:flutter/material.dart';

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
                  //MateriasProvider.db.add(MateriasModel(nombre: materiaController.text));
                  materiaBloc.addMateria(MateriasModel(nombre: materiaController.text));
                },
              ),
            ],
          ),
        ),
      ),

    );
  }
}
