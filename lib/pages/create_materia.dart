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
          title: Text('Agregar Materias'),
        ),
        body: _materiaForm(context)

      ),

    );
  }

  Widget _materiaForm(BuildContext context){
    final size = MediaQuery.of(context).size;
    return Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 80.0,
            ),
          ),
          //SizedBox(height: 70.0,),
          Container(
            width: size.width * 0.85,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            margin: EdgeInsets.symmetric(vertical: 30.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.0,0.5),
                  spreadRadius: 3.0
                )
              ]
            ),

            child: Column(
              children: <Widget>[
                SizedBox(height: 40.0,),
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                    contentPadding: EdgeInsets.all(20.0),
                    labelText: 'Materia',
                    suffixIcon: Icon(Icons.book),
                    labelStyle: TextStyle(fontSize: 18.0)
                  ),
                  controller: materiaController,
                ),
                SizedBox(height: 20.0,),

                RaisedButton(
                  child: Text('Agregar'),
                  onPressed: () {
                    //MateriasProvider.db.add(MateriasModel(nombre: materiaController.text));
                    materiaBloc.addMateria(MateriasModel(nombre: materiaController.text));
                  },
                ),
                SizedBox(height: 30.0,),
              ],
            ),
          ),
        ],
      );
  }

}
