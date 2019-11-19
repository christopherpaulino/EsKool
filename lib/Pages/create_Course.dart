import 'package:flutter/material.dart';
import 'package:eskool/Blocs/Bloc Cursos/curso_bloc.dart';
import 'package:eskool/Models/cursoModel.dart';
import 'package:eskool/Pages/materias_page.dart';

class CreateCourse extends StatelessWidget {
  @override

  final cursoController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final cursoBloc  = CursoBloc();
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
          title: Text('Agregar Curso'),
        ),
        body: Container(
          //margin: EdgeInsets.all(50.0),
          //padding: EdgeInsets.all(100.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 70.0,),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20.0),
                  labelText: 'Curso',
                ),
                controller: cursoController,
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
                onPressed: (){
                  //CursoProvider.db.addCurso(CursoModel(nombre: cursoController.text));
                  cursoBloc.addCurso(CursoModel(nombre: cursoController.text));
                  if(_formKey.currentState.validate()){
                   //CursoProvider.db.addCurso(CursoModel(nombre: cursoController.text));


                    final snackBar = SnackBar(
                      duration: Duration(milliseconds:1200),
                      content: Text('El usuario ha sido guardado'),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: (){},
                      ),

                    );
                    Scaffold.of(context).showSnackBar(snackBar);
                    _formKey.currentState?.reset();
                  }
                },
              ),
              RaisedButton(
                child: Text('Agregar Materias'),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MateriasPage()));
                },
              )
            ],
          ),
        ),
      ),
    ),
    );
  }
}
