import 'package:flutter/material.dart';

class createCourse extends StatefulWidget {
  @override
  _createCourseState createState() => _createCourseState();
}

class _createCourseState extends State<createCourse> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
          title: Text('Agregar Curso'),

        ),
      ),
    );
  }
}
