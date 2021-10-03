import 'package:clean_core/clean_core.dart';

import 'AbstractRepository.dart';

abstract class CRUDRepositoryAsync<Domain extends BasicDomainObject>
    extends AbstractRepository {
  Future<Domain> create(Domain newObject);

  Future<Domain> edit(Domain objectToEdit);

  Future<Domain> destroy(Domain objectToDestroy);

  Future<Domain> findBy(int keyId);

  Future<List<Domain>> findAll();

  Future<int> count() {
    return findAll().then((value) => value.length);
  }
}
