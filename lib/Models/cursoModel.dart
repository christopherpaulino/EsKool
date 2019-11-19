class CursoModel{
  int id;
  String nombre;


  CursoModel({this.id, this.nombre});

  //Constructor
  CursoModel.fromMap(Map<String, dynamic>map){
    id = map['id'];
    nombre = map['nombre'];
  }

  //Metodo
  Map<String, dynamic> toMap(){
    return{
      'id': id,
      'nombre': nombre,
    };
  }
}