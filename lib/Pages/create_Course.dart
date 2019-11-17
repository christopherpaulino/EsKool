import 'package:flutter/material.dart';
import 'package:eskool/Models/cursoModel.dart';
import 'package:eskool/Providers/db_providers.dart';

class createCourse extends StatefulWidget {
  @override
  _createCourseState createState() => _createCourseState();
}

class _createCourseState extends State<createCourse> {
  @override

  final cursoController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
          title: Text('Agregar Curso'),
        ),
        body: Container(
          margin: EdgeInsets.all(50.0),
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
                  final snackBar = SnackBar(
                    duration: Duration(milliseconds:1200),
                    content: Text('Curso Agregado'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: (){
                        if(_formKey.currentState.validate()){
                          CursoPrivider.db.addCurso(CursoModel(nombre: cursoController.text));
                        }
                      },
                    ),
              );
                  Scaffold.of(context).showSnackBar(snackBar);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
