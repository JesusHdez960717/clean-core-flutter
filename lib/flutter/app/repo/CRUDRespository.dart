import 'AbstractRespository.dart';

abstract class CRUDRespository<T> extends AbstractRespository {
  T create(T newObject);

  T update(T objectToEdit);

  T destroy(T objectToDestroy);

  T destroyById(Object keyId);

  T findBy(Object keyId);

  List<T> findAll();

  int count() {
    return findAll().length;
  }
}
