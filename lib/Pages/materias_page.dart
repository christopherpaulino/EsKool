import 'package:eskool/Pages/create_materia.dart';
import 'package:flutter/material.dart';
import 'package:eskool/Models/materiasModel.dart';
import 'package:eskool/Providers/db_providers.dart';
import 'package:eskool/Blocs/Bloc Materias/materia_bloc.dart';



class MateriasPage extends StatelessWidget {
  @override

  final materiasBloc = MateriaBloc();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      ),
      body: StreamBuilder<List<MateriasModel>>(
        stream: materiaBloc.materiaStrem,
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

      return Center(
        child: Column(
          children:<Widget>[

            CheckboxListTile(

              title: Text(materia.nombre, style: TextStyle(fontSize: 20.0),),
              value: true,
              //onChanged: (){};
            ),

            Divider(
              thickness: 2.0,
              color: Colors.lightBlue,
              indent: 20.0,
              endIndent: 20.0,
            ),
          ],
        ),
      );







//      return Dismissible(
//        key: UniqueKey(),
//        background: Container(
//          color: Colors.greenAccent,
//          child: Icon(Icons.update),
//        ),
//        onDismissed: (direction) {
//          if (direction == DismissDirection.endToStart) {
//            //DBProvider.db.deleteUserById(user.id);
//            Scaffold.of(context).showSnackBar(
//                SnackBar(content: Text("Usuario borrado"),)
//            );
//          }
//
//          if (direction == DismissDirection.startToEnd) {
//
//          }
//        },
//        secondaryBackground: Container(
//          color: Colors.redAccent,
//          child: Icon(Icons.delete),
//        ),
//
//        child: Column(
//
//          children: <Widget>[
//            ListTile(
//              leading: Icon(Icons.perm_identity),
//              title: Text(materia.nombre),
//              subtitle: Text('ID: ${materia.id}' ),
//              trailing: Icon(Icons.arrow_forward_ios),
//              onTap: () {
//                // Navigator.pushNamed(context, 'user_details', arguments: 'user');
//              },
//            ),
//            Divider(
//              thickness: 2.0,
//              color: Colors.lightBlue,
//              indent: 70.0,
//              endIndent: 20.0,
//            )
//          ],
//        ),
//      );
    }
    ).toList();
  }

}
