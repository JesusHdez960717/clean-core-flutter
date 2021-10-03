import 'package:clean_core/flutter/domain/CleanCoreDomainExporter.dart';

import 'AbstractUseCase.dart';

abstract class CRUDUseCase<Domain extends BasicDomainObject>
    implements AbstractUseCase {
  Domain create(Domain newObject);

  Domain edit(Domain objectToEdit);

  Domain destroy(Domain objectToDestroy);

  Domain findBy(int keyId);

  List<Domain> findAll();

  int count() {
    return findAll().length;
  }
}
