import 'package:flutter/material.dart';

class adminPage extends StatefulWidget {
  @override
  _adminPageState createState() => _adminPageState();
}

class _adminPageState extends State<adminPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),

          children: <Widget>[
            Card(
              child: ListTile(
                leading: Icon(Icons.settings),
                title: Text('Conf. de la Cuenta'),
                onTap: (){},
              ),
            ),

            Card(
              child: ListTile(
                leading: Icon(Icons.person_add),
                title: Text('Agregar Estudiante'),
                onTap: (){},
              ),
            ),

            Card(
              child: ListTile(
                leading: Icon(Icons.school),
                title: Text('Agregar Curso'),
                onTap: (){},
              ),
            ),

            Card(
              child: ListTile(
                leading: Icon(Icons.playlist_add_check),
                title: Text('Pase de lista'),
                onTap: (){},
              ),
            ),

            Card(
              child: ListTile(
                leading: Icon(Icons.list),
                title: Text('Lista de Excusas'),
                onTap: (){},
              ),
            )

          ],

        )
      ),
    );
  }
}
