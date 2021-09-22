import 'package:clean_core/flutter/domain/CleanCoreDomainExporter.dart';

import 'AbstractRespository.dart';

abstract class CRUDRespositoryAsync<Domain extends BasicDomainObject>
    extends AbstractRespository {
  Future<Domain> create(Domain newObject);

  Future<Domain> edit(Domain objectToEdit);

  Future<Domain> destroy(Domain objectToDestroy);

  Future<Domain> findBy(int keyId);

  Future<List<Domain>> findAll();

  Future<int> count() {
    return findAll().then((value) => value.length);
  }
}
