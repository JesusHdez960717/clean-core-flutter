import 'package:clean_core/clean_core.dart';

import 'AbstractUseCase.dart';

///[AbstractUseCase] of CRUD operations, of type Domain extends [BasicDomainObject].
///Generally not implemented, instead extends the repo from [DefaultCRUDUseCase].
///
/// See [AbstractUseCase] for general info.
///
/// Example at [DefaultCRUDUseCase]
abstract class CRUDUseCase<Domain extends BasicDomainObject>
    implements AbstractUseCase {
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
