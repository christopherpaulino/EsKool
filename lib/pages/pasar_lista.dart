import 'package:eskool/models/estudiante_model.dart';
import 'package:eskool/providers/db_providers.dart';
import 'package:flutter/material.dart';

class PasarLista extends StatefulWidget {
  @override
  _PasarListaState createState() => _PasarListaState();
}

class _PasarListaState extends State<PasarLista> {
  @override

  final check = new Set<ListTile>();

  Widget build(BuildContext context) {
    return Scaffold(
      body:  FutureBuilder<List<EstudianteModel>>(
        future: EstudiantesProvider.db.list(),
        builder: (BuildContext context, AsyncSnapshot<List<EstudianteModel>> snapshot){
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
              children: _listaMapEstudiante(context, snapshot.data),
            );
        },
      ),
    );

  }

  List<Widget> _listaMapEstudiante(BuildContext context, List<EstudianteModel> estud) {
    return  estud.map((estudiante) {
      final isChecked = check.contains(estudiante);

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
              title: Text(estudiante.nombre),
              subtitle: Text('ID: ${estudiante.esturiante_id}'),
              trailing: new Icon(isChecked ? Icons.check_box : Icons.check_box_outline_blank),
              onTap: () {

                //Navigator.pushNamed(context, 'user_details', arguments: 'user');
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








