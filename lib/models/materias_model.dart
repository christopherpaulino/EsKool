class MateriasModel{
  int id;
  String nombre;

  MateriasModel({this.id, this.nombre});

  //Constructor
  MateriasModel.fromMap(Map<String, dynamic>map){
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
