import 'package:eskool/blocs/bloc_curso/curso_bloc.dart';
import 'package:eskool/models/curso_model.dart';
import 'package:eskool/providers/db_providers.dart';
import 'package:flutter/material.dart';

import 'curso_menu.dart';
import 'materias_page.dart';

class CoursePage extends StatefulWidget {
  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override

final cursoBloc = CursoBloc();

  Widget build(BuildContext context) {
    return Scaffold(
      body:
//      StreamBuilder<List<CursoModel>>(
//        stream: cursoBloc.cursoStream,
        FutureBuilder<List<CursoModel>>(
          future: CursoProvider.db.list(),
          builder: (BuildContext context, AsyncSnapshot<List<CursoModel>> snapshot) {

          if (!snapshot.hasData) {
            return
              Center(
                child: CircularProgressIndicator(),
              );
          }

          if (snapshot.data ==0) {
            return Center(
              child: Text(
                'No hay usuarios registrados',
                style: TextStyle(fontSize: 28.0, color: Colors.red),
              ),
            );
          }
          return
              ListView(
                children: _listaMapCursos(context, snapshot.data),
              );
        },
      ),
    ) ;
  }

  List<Widget> _listaMapCursos(BuildContext context, List<CursoModel> curso) {
    return  curso.map((cursos) {

      return Column(
          children: <Widget>[
            Card(
              child: ListTile(
                leading: Icon(Icons.school),
                title: Text(cursos.nombre),
              subtitle: Text(cursos.centro),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                 // Navigator.pushNamed(context, 'createCourse', arguments: curso);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CursoMenu()));
                },
              ),
            ),
          ],
        );
    }
    ).toList();
  }
}
