import 'package:eskool/Pages/create_materia.dart';
import 'package:eskool/blocs/bloc_materias/materia_bloc.dart';
import 'package:eskool/models/materias_model.dart';
import 'package:eskool/providers/db_providers.dart';
import 'package:flutter/material.dart';

class MateriasPage extends StatefulWidget {
  @override
  _MateriasPageState createState() => _MateriasPageState();
}

class _MateriasPageState extends State<MateriasPage> {
  @override

  final materiasBloc = MateriaBloc();

  bool _check = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      ),
      body:
//      StreamBuilder<List<MateriasModel>>(
//        stream: materiaBloc.materiaStrem,
        FutureBuilder<List<MateriasModel>>(
          future: MateriasProvider.db.list(),
          builder: (BuildContext context, AsyncSnapshot<List<MateriasModel>> snapshot){
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
        children: _listaMapMaterias(context, snapshot.data),
        );
      },
      ),
    );
  }

  List<Widget> _listaMapMaterias(BuildContext context, List<MateriasModel> materia) {
    return  materia.map((materia) {

      return Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.greenAccent,
          child: Icon(Icons.update),
        ),
        onDismissed: (direction) {
          if (direction == DismissDirection.endToStart) {
//            DBProvider.db.deleteUserById(user.id);
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
              leading: Icon(Icons.school),
              title: Text(materia.nombre),
              subtitle: Text('ID: ${materia.materia_id}'),
              trailing: Icon(Icons.arrow_forward_ios),
//              onTap: () {
//                Navigator.pushNamed(context, 'user_details', arguments: 'user');
//              },
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
