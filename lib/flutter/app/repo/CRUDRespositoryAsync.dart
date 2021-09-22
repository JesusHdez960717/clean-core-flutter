import 'package:clean_core/flutter/domain/CleanCoreDomainExporter.dart';

import 'AbstractRespository.dart';

abstract class CRUDRespositoryAsync<T extends BasicDomainObject>
    extends AbstractRespository {
  Future<T> create(T newObject);

  Future<T> update(T objectToEdit);

  Future<T> destroy(T objectToDestroy);

  Future<T> findBy(Object keyId);

  Future<List<T>> findAll();

  Future<int> count() {
    return findAll().then((value) => value.length);
  }
}
