import 'package:clean_core/clean_core.dart';

import 'AbstractRepository.dart';

///AbstractRepository of CRUD operations, of type Domain extends [BasicDomainObject].
///Generally not implemented, instead extends the repo from [DefaultCRUDRepo].
///
/// See [AbstractRepository] for general info.
abstract class CRUDRepository<Domain extends BasicDomainObject>
    extends AbstractRepository {
  ///Create the domain.
  Domain create(Domain newObject);

  ///Edit the domain.
  Domain edit(Domain objectToEdit);

  ///Destroy the domain.
  Domain destroy(Domain objectToDestroy);

  ///Find the correspondent domain by it's Key Id.
  Domain findBy(int keyId);

  ///Find all domains.
  List<Domain> findAll();

  ///Count the amount of domains.
  ///By default calling the length of findAll().
  int count() {
    return findAll().length;
  }
}
