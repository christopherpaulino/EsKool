class MateriasModel{
  int materia_id;
  String nombre;

  MateriasModel({this.materia_id, this.nombre});

  //Constructor
  MateriasModel.fromMap(Map<String, dynamic>map){
    materia_id = map['id_materia'];
    nombre = map['nombre'];
  }

  //Metodo
  Map<String, dynamic> toMap(){
    return{
      'id_materia': materia_id,
      'nombre': nombre,
    };
  }


}
