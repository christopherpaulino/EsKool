abstract class Respository<T>{
/*


  Future<void> delete(int id);
*/
  Future<void> add(T model);

  Future<List<T>> list();

  Future<void> update(T model);
/*
  Future<List<T>> search(int mes);
*/
}