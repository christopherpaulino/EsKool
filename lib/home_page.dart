import 'package:flutter/material.dart';
import 'package:eskool/Pages/admin_Page.dart';

class HomePage extends StatefulWidget{


  @override
  State createState() =>HomeState();
}

class HomeState extends State<HomePage>{



 Widget _pageChooser(int page){
   switch(page){
     case 0:
       return adminPage();
   }

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
//        onTap: (){
//
//        },
      ),
      body: Center(
        child: Text("klk"),
      ),
    );
  }
}