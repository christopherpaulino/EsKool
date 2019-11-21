import 'package:flutter/cupertino.dart';

class EstudianteModel{
  int esturiante_id, curso_id, materia_id ;
  String nombre, madre_nombre, madre_tel, madre_email,  padre_nombre, padre_tel, padre_email;

  EstudianteModel({
    this.esturiante_id,
    this.curso_id,
    this.materia_id,
    this.nombre,
    this.madre_nombre,
    this.madre_email,
    this.madre_tel,
    this.padre_nombre,
    this.padre_tel,
    this.padre_email
  });

//Constructor
  EstudianteModel.fromMap(Map<String, dynamic>map){
    esturiante_id = map['estudiante_id'];
    nombre = map['nombre'];
}

//Metodo
  Map<String, dynamic> toMap(){
    return{
      'estudiante_id': esturiante_id,
      'nombre': nombre,
    };
}





}