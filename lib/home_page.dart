import 'package:eskool/Pages/course_Page.dart';
import 'package:eskool/Pages/pasar_lista.dart';
import 'package:flutter/material.dart';
import 'package:eskool/Pages/admin_Page.dart';

class HomePage extends StatefulWidget{


  @override
  State createState() =>HomeState();
}

class HomeState extends State<HomePage>{

  int _selectedPage=0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
 Widget getContentWidget() {
    switch (_selectedPage) {
      case 0:
        return PasarLista();
      case 1:
        return CoursePage();
      case 2:
        return adminPage();


      default:
        return Center(
          child: Text(
            "Not Found 404",
            style: TextStyle(fontSize: 32.0, color: Colors.red),
          ),
        );
    }
  }

  void _onItemTapped(int page) {
    setState(() {
      _selectedPage = page;
    });
  }

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
        currentIndex: _selectedPage,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      body: Center(
        child: getContentWidget(),
      ),
    );
  }
}