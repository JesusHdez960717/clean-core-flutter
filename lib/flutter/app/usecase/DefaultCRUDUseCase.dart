import '../repo/CRUDRespository.dart';

import '../PropertyChangeConstrains.dart';

abstract class DefaultCRUDUseCase<T extends Comparable<T>>
    extends CRUDRespository<T> {
  CRUDRespository<T> repo;

  DefaultCRUDUseCase({required this.repo});

  //const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  T create(T newObject) {
    print("${PropertyChangeConstrains.BEFORE_CREATE}  => $newObject");
    repo.create(newObject);
    print("${PropertyChangeConstrains.AFTER_CREATE}  => $newObject");
    return newObject;
  }

  @override
  List<T> findAll() {
    print("${PropertyChangeConstrains.BEFORE_FIND_ALL}  => EmptyList{}");
    List<T> list = repo.findAll();
    print("${PropertyChangeConstrains.AFTER_FIND_ALL}  => $list");
    return list;
  }

  @override
  T findBy(Object keyId) {
    print("${PropertyChangeConstrains.BEFORE_FIND_BY}  => $keyId");
    T object = repo.findBy(keyId);
    print("${PropertyChangeConstrains.AFTER_FIND_BY}  => $keyId");
    return object;
  }

  @override
  T destroy(T objectToDestroy) {
    print("${PropertyChangeConstrains.BEFORE_DESTROY}  => $objectToDestroy");
    repo.destroy(objectToDestroy);
    print("${PropertyChangeConstrains.AFTER_DESTROY}  => $objectToDestroy");
    return objectToDestroy;
  }

  @override
  T destroyById(Object keyId) {
    print("${PropertyChangeConstrains.BEFORE_DESTROY_BY_ID}  => $keyId");
    T domain = repo.destroyById(keyId);
    print("${PropertyChangeConstrains.AFTER_DESTROY_BY_ID}  => $keyId");
    return domain;
  }

  @override
  T update(T objectToEdit) {
    print("${PropertyChangeConstrains.BEFORE_EDIT}  => $objectToEdit");
    T domain = repo.update(objectToEdit);
    print("${PropertyChangeConstrains.AFTER_EDIT}  => $objectToEdit");
    return domain;
  }

  @override
  int count() {
    return repo.count();
  }
}
