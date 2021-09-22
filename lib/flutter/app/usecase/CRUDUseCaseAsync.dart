import 'package:clean_core/flutter/domain/CleanCoreDomainExporter.dart';

import 'AbstractUseCase.dart';

abstract class CRUDUseCaseAsync<T extends BasicDomainObject>
    implements AbstractUseCase {
  Future<T> create(T newObject);

  Future<T> edit(T objectToEdit);

  Future<T> destroy(T objectToDestroy);

  Future<T> findBy(int keyId);

  Future<List<T>> findAll();

  Future<int> count() async {
    return findAll().then((value) => value.length);
  }
}
