import 'package:eskool/models/estudiante_model.dart';
import 'package:eskool/providers/db_providers.dart';
import 'package:flutter/material.dart';

class create_student extends StatefulWidget {
  @override
  _create_studentState createState() => _create_studentState();
}

class _create_studentState extends State<create_student> {
  @override

  TextEditingController nombreController = new TextEditingController();
  TextEditingController apellidosController = new TextEditingController();
  TextEditingController fechaController = new TextEditingController();
  TextEditingController madreController = new TextEditingController();
  TextEditingController madreTelController = new TextEditingController();
  TextEditingController madreEmailController = new TextEditingController();
  TextEditingController padreController = new TextEditingController();
  TextEditingController padreTelController = new TextEditingController();
  TextEditingController padreEmailController = new TextEditingController();


  String _fecha = '';

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Agregar Estudiante'),
      ),
      body: _studentForm(context),
    );
  }

  Widget _studentForm(context){
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(

      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 40.0,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            padding: EdgeInsets.symmetric(vertical: 30.0),
            width: size.width * 0.85,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.0,5.0),
                  spreadRadius: 3.0
                )
              ],
            ),
            child: Column(
              children: <Widget>[
                Text('Datos', style: TextStyle(fontSize: 20.0),),
                SizedBox(height: 20.0,),
                _nombre(),
                Divider(),
//                _apellidos(),
//                Divider(),
                _fechaNacimiento(context),
                Divider(),
                _madre(),
                Divider(),
                _madreTel(),
                Divider(),
                _madreEmail(),
                Divider(),
                _padre(),
                Divider(),
                _padreTel(),
                Divider(),
                _padreEmail(),
                Divider(),
                _guardar()
              ],
            )
          ),
        ],
      ),
    );
  }

  Widget _nombre(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: TextFormField(
        autofocus: true,
        controller: nombreController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0)
          ),
          //icon: Icon(Icons.),
          labelText: 'Nombre',
          labelStyle: TextStyle(fontSize: 18.0),
          hintText: 'Juan Perez',
          suffixIcon: Icon(Icons.accessibility)
        ),
      ),
    );
  }

  Widget _apellidos(){
    return Container(

      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: TextFormField(

        controller: apellidosController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0)
          ),
          labelText: 'Perez Nuñez',
          labelStyle: TextStyle(fontSize: 18.0),
          hintText: 'Perez',

        ),
      ),
    );
  }

  Widget _fechaNacimiento(BuildContext contex){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: TextFormField(
        controller: fechaController,
        enableInteractiveSelection: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0)
              ),
          labelText: 'Fecha de nacimiento',
          labelStyle: TextStyle(fontSize: 18.0),
          hintText: 'Fecha de Nacimiento',
          suffixIcon: Icon(Icons.calendar_today)
        ),
        onTap: (){
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectDate(contex);
        },
      ),
    );
  }

  Widget _madre(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        controller: madreController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0)
          ),
          labelText: 'Nombre de la Madre',
          labelStyle: TextStyle(fontSize: 18.0),
          hintText: 'Juana Nuñez'
        ),
      ),
    );
  }

  Widget _madreTel(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        controller: madreTelController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0)
            ),
            labelText: 'Telefono',
            labelStyle: TextStyle(fontSize: 18.0),
            hintText: '8092905555',
            suffixIcon: Icon(Icons.call)
        ),
      ),
    );
  }

  Widget _madreEmail(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        controller: madreEmailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0)
            ),
            labelText: 'Correo',
            labelStyle: TextStyle(fontSize: 18.0),
            hintText: 'juana@hotmail.com',
            suffixIcon: Icon(Icons.alternate_email)
        ),
      ),
    );
  }

  Widget _padre (){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        controller: padreController,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0)
            ),
            labelText: 'Nombre del Padre',
            labelStyle: TextStyle(fontSize: 18.0),
            hintText: 'Juan Perez'
        ),
      ),
    );
  }

  Widget _padreTel(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        controller: padreTelController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0)
            ),
            labelText: 'Telefono',
            labelStyle: TextStyle(fontSize: 18.0),
            hintText: '8092905555',
            suffixIcon: Icon(Icons.call)
        ),
      ),
    );
  }

  Widget _padreEmail(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        controller: padreEmailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0)
            ),
            labelText: 'Correo',
            labelStyle: TextStyle(fontSize: 18.0),
            hintText: 'juan@hotmail.com',
            suffixIcon: Icon(Icons.alternate_email)
        ),
      ),
    );
  }

  _selectDate(BuildContext contex) async {
    DateTime picked = await showDatePicker(
        context: contex,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(1980),
        lastDate: new DateTime.now()
    );
    if(picked != null){
      setState(() {
        _fecha = picked.toString();
        fechaController.text = _fecha;
      });
    }
  }

  _guardar() {
    return RaisedButton(
      child: Text('Agregar'),
      onPressed: (){
        EstudiantesProvider.db.add(EstudianteModel(nombre: nombreController.text));
        nombreController.clear();
        fechaController.clear();
        madreEmailController.clear();
        madreTelController.clear();
        madreController.clear();
        padreEmailController.clear();
        padreTelController.clear();
        padreController.clear();
        //Navigator.push(context, MaterialPageRoute(builder: (context) => create_student()));
      },

    );

  }
}
