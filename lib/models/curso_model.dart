class CursoModel{
  int curso_id;
  int materia_id;
  String nombre, centro;

  CursoModel({this.curso_id, this.nombre, this.materia_id, this.centro});

  //Constructor
  CursoModel.fromMap(Map<String, dynamic>map){
    curso_id = map['curso_id'];
    nombre = map['nombre'];
    materia_id =map['materia_id'];
    centro = map['centro'];
  }

  //Metodo
  Map<String, dynamic> toMap(){
    return{
      'curso_id': curso_id,
      'nombre': nombre,
      'materia_id': materia_id,
      'centro': centro,
    };
  }
}