import 'package:eskool/pages/course_page.dart';
import 'package:eskool/pages/create_materia.dart';
import 'package:eskool/pages/create_student.dart';
import 'package:flutter/material.dart';
import 'create_course.dart';


class adminPage extends StatefulWidget {
  @override
  _adminPageState createState() => _adminPageState();
}

class _adminPageState extends State<adminPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(

            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
              SizedBox(height: 54.0,),
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
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => create_student()));
                    },
                  ),
                ),

                Card(
                  child: ListTile(
                    leading: Icon(Icons.school),
                    title: Text('Agregar Curso'),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CreateCourse()));
                    },
                  ),
                ),

                Card(
                  child: ListTile(
                    leading: Icon(Icons.book),
                    title: Text('Materias'),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CreateMateria()));
                    },
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
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CoursePage()));
                    },
                  ),
                )
            ],
          )
        ),
      ),
    );
  }
}
