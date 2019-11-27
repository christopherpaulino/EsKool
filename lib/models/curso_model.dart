


class CursoModel{
  int id;
  String grado,centro;



  CursoModel({this.id, this.grado, this.centro}); //Constructor

  CursoModel.fromMap(Map<String, dynamic>map){
    id = map['id'];
    grado = map['grado'];
    centro =map['centro'];
  }

  //Metodo
  Map<String, dynamic> toMap(){
    return{
      'id': id,
      'grado': grado,
      'centro':centro
      //'idMateria'; idMateria,
    };
  }
}