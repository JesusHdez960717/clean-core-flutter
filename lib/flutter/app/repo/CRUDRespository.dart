import 'package:clean_core/flutter/domain/CleanCoreDomainExporter.dart';

import 'AbstractRespository.dart';

abstract class CRUDRespository<T extends BasicDomainObject>
    extends AbstractRespository {
  T create(T newObject);

  T update(T objectToEdit);

  T destroy(T objectToDestroy);

  T findBy(Object keyId);

  List<T> findAll();

  int count() {
    return findAll().length;
  }
}
