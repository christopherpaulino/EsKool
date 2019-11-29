import 'package:eskool/pages/materias_page.dart';
import 'package:flutter/material.dart';

class CursoMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(
          child:  RaisedButton(
            child: Text('Materias'),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MateriasPage()));
            }
          )
        )
      ),
    );
  }

  _materiasBoton(context) {


    RaisedButton(
      child: Text('Estudiantes'),
      onPressed: (){
        //Navigator.push(context, MaterialPageRoute(builder: (context) => ))
      },
    );
  }
}
