class CursoModel{
  int id, idMateria;
  String nombre;

  CursoModel({this.id, this.nombre, this.idMateria});

  //Constructor
  CursoModel.fromMap(Map<String, dynamic>map){
    id = map['id'];
    nombre = map['nombre'];
   // idMateria =map['idMateria'];
  }

  //Metodo
  Map<String, dynamic> toMap(){
    return{
      'id': id,
      'nombre': nombre,
      //'idMateria'; idMateria,
    };
  }
}