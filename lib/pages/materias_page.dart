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

      return Center(
        child: Column(
          children:<Widget>[
            CheckboxListTile(
              title: Text(materia.nombre, style: TextStyle(fontSize: 20.0),),
              value: _check,
              onChanged: (valor){
                setState(() {
                  _check = valor;
                });
              }
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
    }
    ).toList();
  }
}
