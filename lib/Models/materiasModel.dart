class MateriasModel{
  int materia_id;
  String nombre;

  MateriasModel({this.materia_id, this.nombre});

  //Constructor
  MateriasModel.fromMap(Map<String, dynamic>map){
    materia_id = map['materia_id'];
    nombre = map['nombre'];
  }

  //Metodo
  Map<String, dynamic> toMap(){
    return{
      'materia_id': materia_id,
      'nombre': nombre,
    };
  }


}
