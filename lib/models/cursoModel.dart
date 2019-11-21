class CursoModel{
  int curso_id;
  int idMateria;
  String nombre;

  CursoModel({this.curso_id, this.nombre, this.idMateria});

  //Constructor
  CursoModel.fromMap(Map<String, dynamic>map){
    curso_id = map['curso_id'];
    nombre = map['nombre'];
   // idMateria =map['idMateria'];
  }

  //Metodo
  Map<String, dynamic> toMap(){
    return{
      'curso_id': curso_id,
      'nombre': nombre,
      //'idMateria'; idMateria,
    };
  }
}