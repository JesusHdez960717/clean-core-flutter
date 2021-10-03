import 'package:clean_core/clean_core.dart';

import 'AbstractRespository.dart';

abstract class CRUDRespository<Domain extends BasicDomainObject>
    extends AbstractRespository {
  Domain create(Domain newObject);

  Domain edit(Domain objectToEdit);

  Domain destroy(Domain objectToDestroy);

  Domain findBy(int keyId);

  List<Domain> findAll();

  int count() {
    return findAll().length;
  }
}
