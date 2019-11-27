import 'package:eskool/Providers/db_providers.dart';
import 'package:eskool/blocs/bloc_curso/curso_bloc.dart';
import 'package:eskool/models/curso_model.dart';
import 'package:eskool/pages/materias_page.dart';
import 'package:flutter/material.dart';

class CreateCourse extends StatelessWidget {
  @override

  final cursoController = TextEditingController();
  final centroController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  CursoBloc cursoBloc;
  CursoModel curso = new CursoModel();
  Widget build(BuildContext context) {

    cursoBloc = CursoBloc();

//    final CursoModel cursoData = ModalRoute.of(context).settings.arguments;
//    if(cursoData !=null){
//      curso = cursoData;
//    }

    return Form(
      //key: _formKey,
      child: Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
          title: Text('Agregar Curso'),
        ),
        body:  _cursoForm(context)
      ),
    ),
    );
  }

  Widget _cursoForm(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: <Widget>[
        SafeArea(
          child: Container(
            height: 40.0,
          ),
        ),

        Container(
          width: size.width * 0.85,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
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
                    labelText: 'Grado',
                    suffixIcon: Icon(Icons.book),
                    labelStyle: TextStyle(fontSize: 18.0)
                ),
                controller: cursoController,
              ),
              SizedBox(height: 20.0,),

              TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                    labelText: 'Centro',
                    suffixIcon: Icon(Icons.location_city),
                    labelStyle: TextStyle(fontSize: 18.0)
                ),
                controller: centroController,
              ),
              SizedBox(height: 20.0,),


              RaisedButton(
                child: Text('Agregar'),
                onPressed: (){
                  curso.grado=cursoController.text;
                  curso.centro = centroController.text;

                  //CursoProvider.db.add(CursoModel(nombre: cursoController.text));
                  cursoBloc.addCurso(curso);
//                  if(_formKey.currentState.validate()){
//                    //CursoProvider.db.addCurso(CursoModel(nombre: cursoController.text));

//                    final snackBar = SnackBar(
//                      duration: Duration(milliseconds:1200),
//                      content: Text('El usuario ha sido guardado'),
//                      action: SnackBarAction(
//                        label: 'Undo',
//                        onPressed: (){},
//                      ),
//
//                    );
//                    Scaffold.of(context).showSnackBar(snackBar);
//                    _formKey.currentState?.reset();
//                  }
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
      ],
    );
  }
}
