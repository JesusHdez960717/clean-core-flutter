import 'package:clean_core/clean_core.dart';

import 'AbstractRepository.dart';

///Default CRUD repository.
abstract class CRUDRepository<Domain extends BasicDomainObject>
    extends AbstractRepository {
  Domain create(Domain newObject);

  Domain edit(Domain objectToEdit);

  Domain destroy(Domain objectToDestroy);

  Domain findBy(int keyId);

  List<Domain> findAll();

  int count() {
    return findAll().length;
  }
}
