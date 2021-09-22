import 'AbstractUseCase.dart';

abstract class CRUDUseCase<T> implements AbstractUseCase {
  T create(T newObject);

  T edit(T objectToEdit);

  T destroy(T objectToDestroy);

  T destroyById(Object keyId);

  T findBy(Object keyId);

  List<T> findAll();

  int count() {
    return findAll().length;
  }
}
