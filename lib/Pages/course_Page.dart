import 'package:eskool/Blocs/Bloc%20Cursos/curso_bloc.dart';
import 'package:eskool/Models/cursoModel.dart';
import 'package:eskool/Providers/db_providers.dart';
import 'package:flutter/material.dart';

class CoursePage extends StatelessWidget {
  @override

final cursoBloc = CursoBloc();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      ),
      body: StreamBuilder<List<CursoModel>>(
        stream: cursoBloc.cursoStream,
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


//  Widget build(BuildContext context){
//    return FutureBuilder<List<CursoModel>>(
//      future: CursoPrivider.db.listCurso(),
//      builder: (BuildContext context, AsyncSnapshot<List<CursoModel>> snapshot) {
//
//        if (!snapshot.hasData) {
//          return
//            Center(
//              child: CircularProgressIndicator(),
//            );
//        }
//
//        if (snapshot.data ==0) {
//          return Center(
//            child: Text(
//              'No hay usuarios registrados',
//              style: TextStyle(fontSize: 28.0, color: Colors.red),
//            ),
//          );
//        }
//
//        return ListView(
//          children: _listaMapUsers(context, snapshot.data),
//        );
//      },
//    );
//
//
//
//  }

  List<Widget> _listaMapCursos(BuildContext context, List<CursoModel> curso) {
    return  curso.map((cursos) {



      return Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.greenAccent,
          child: Icon(Icons.update),
        ),
        onDismissed: (direction) {
          if (direction == DismissDirection.endToStart) {
            //DBProvider.db.deleteUserById(user.id);
            Scaffold.of(context).showSnackBar(
                SnackBar(content: Text("Usuario borrado"),)
            );
          }

          if (direction == DismissDirection.startToEnd) {

          }
        },
        secondaryBackground: Container(
          color: Colors.redAccent,
          child: Icon(Icons.delete),
        ),

        child: Column(

          children: <Widget>[
            ListTile(
              leading: Icon(Icons.perm_identity),
              title: Text(cursos.nombre),
              subtitle: Text('ID: ${cursos.id}' ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
               // Navigator.pushNamed(context, 'user_details', arguments: 'user');
              },
            ),
            Divider(
              thickness: 2.0,
              color: Colors.lightBlue,
              indent: 70.0,
              endIndent: 20.0,
            )
          ],
        ),
      );
    }
    ).toList();
  }

}
