import 'package:eskool/Providers/db_providers.dart';
import 'package:eskool/blocs/bloc_curso/curso_bloc.dart';
import 'package:eskool/models/curso_model.dart';
import 'package:eskool/pages/materias_page.dart';
import 'package:flutter/material.dart';

class CreateCourse extends StatefulWidget {
  @override
  _CreateCourseState createState() => _CreateCourseState();
}

class _CreateCourseState extends State<CreateCourse> {
  @override


  bool esp = false,  mat = false, his = false, bio = false, _isSelected = false;
  int Value = 0;




  final cursoController = TextEditingController();

  final centroController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  CursoBloc cursoBloc;

  CursoModel Curso = new CursoModel();

  Widget build(BuildContext context) {

    cursoBloc = CursoBloc();
//
//    final CursoModel cursoData = ModalRoute.of(context).settings.arguments;
//    if(cursoData !=null){
//      Curso = cursoData;
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

    return SingleChildScrollView(
      child:
        Column(
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

                  Container(
                      child: Column(
                        children: <Widget>[
                          CheckboxListTile(
                            title: Text('Español'),
                            value: esp,
                            onChanged: (_isSelected){
                              setState(() {
                                esp = _isSelected;
                              });
                            },
                          ),
                          CheckboxListTile(
                            title: Text('Matemáticas'),
                            value: mat,
                            onChanged: (_isSelected){
                              setState(() {
                                mat = _isSelected;
                              });
                            },
                          ),
                          CheckboxListTile(
                            title: Text('Historia'),
                            value: his,
                            onChanged: (_isSelected){
                              setState(() {
                                his = _isSelected;
                              });
                            },
                          ),
                          CheckboxListTile(
                            title: Text('Bioloía'),
                            value:bio,
                            onChanged: (_isSelected){
                              setState(() {
                                bio = _isSelected;
                              });
                            },
                          )
                        ],
                      )
                  ),



                  RaisedButton(
                    child: Text('Agregar'),
                    onPressed: (){
                      //CursoProvider.db.add(CursoModel(nombre: cursoController.text));
                    //  cursoBloc.addCurso(CursoModel());

                      print(' Este es el valor $bio');
                      if(esp == true){
                        int espanol = 1;
                        cursoBloc.addCurso(CursoModel(materia_id: espanol, nombre: cursoController.text, centro: centroController.text));
                      }
                      else if(mat == true){
                        int matematicas = 2;
                        cursoBloc.addCurso(CursoModel(materia_id: matematicas, nombre: cursoController.text, centro: centroController.text));
                      }
                      else if(his == true){
                        int historia = 3;
                        cursoBloc.addCurso(CursoModel(materia_id: historia, nombre: cursoController.text, centro: centroController.text));
                      }
                      else {
                        int biologia = 4;
                        cursoBloc.addCurso(CursoModel(materia_id: biologia,nombre: cursoController.text, centro: centroController.text));
                      }
                      centroController.clear();
                      cursoController.clear();
                     // Navigator.push(context, MaterialPageRoute(builder: (context) => CreateCourse()));

                    },
                  ),
//              RaisedButton(
//                child: Text('Agregar Materias'),
//                onPressed: (){
//                  Navigator.push(context, MaterialPageRoute(builder: (context) => MateriasPage()));
//                },
//              )
                ],
              ),
            ),
          ],
        )
    );
  }
}
