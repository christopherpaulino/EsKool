

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{


  @override
  State createState() =>HomeState();
}

class HomeState extends State<HomePage>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('Pasar Lista')
          ), BottomNavigationBarItem(
              icon: Icon(Icons.import_contacts),
              title: Text('Cursos')
          ), BottomNavigationBarItem(
              icon: Icon(Icons.settings),

              
              title: Text('Administrar')
          )
        ],
      ),
      body: Center(
        child: Text("klk"),
      ),
    );
  }
}