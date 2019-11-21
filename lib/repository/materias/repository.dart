abstract class Repository<T>{

  Future<List<T>> list();
  Future<void> add(T model);

}