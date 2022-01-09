import 'package:clean_core/clean_core.dart';

///[AbstractUseCase] of CRUD operations, of type Domain extends [BasicDomainObject].
///Generally not implemented, instead extends the repo from [DefaultCRUDUseCase].
///
/// See [AbstractUseCase] for general info.
///
/// EXAMPLE:
/// This is the definition of Parent CRUDUseCase, it need to be
/// implemented after, implementation example at [DefaultCRUDUseCase].
/// ```dart
///   abstract class ParentUseCase extends CRUDUseCase<ParentDomain> {
///     void doStuffInUseCase();
///   }
/// ```
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

  void init();

  void dispose();
}
