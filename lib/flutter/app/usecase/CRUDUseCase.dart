import 'package:clean_core/flutter/domain/CleanCoreDomainExporter.dart';

import 'AbstractUseCase.dart';

abstract class CRUDUseCase<T extends BasicDomainObject>
    implements AbstractUseCase {
  T create(T newObject);

  T edit(T objectToEdit);

  T destroy(T objectToDestroy);

  T findBy(int keyId);

  List<T> findAll();

  int count() {
    return findAll().length;
  }
}
