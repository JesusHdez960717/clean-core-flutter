import 'package:clean_core/clean_core.dart';

import 'AbstractRepository.dart';

///AbstractRepository of CRUD operations, of type Domain extends
///[BasicDomainObject] for Async operations.
///Generally not implemented, instead extends the repo from [DefaultCRUDRepoAsync].
///
/// See [AbstractRepository] for general info.
abstract class CRUDRepositoryAsync<Domain extends BasicDomainObject>
    extends AbstractRepository {
  ///Create the domain.
  Future<Domain> create(Domain newObject);

  ///Edit the domain.
  Future<Domain> edit(Domain objectToEdit);

  ///Destroy the domain.
  Future<Domain> destroy(Domain objectToDestroy);

  ///Find the correspondent domain by it's Key Id.
  Future<Domain> findBy(int keyId);

  ///Find all domains.
  Future<List<Domain>> findAll();

  ///Count the amount of domains.
  ///By default calling the length of findAll().
  Future<int> count() {
    return findAll().then((value) => value.length);
  }
}
