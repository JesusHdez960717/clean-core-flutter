import 'package:clean_core/clean_core.dart';

///[AbstractUseCase] of CRUD Async operations, of type Domain extends [BasicDomainObject].
///Generally not implemented, instead extends the use case from [DefaultCRUDUseCase].
///
/// See [AbstractUseCase] for general info.
///
/// Example at [DefaultCRUDUseCaseAsync]
abstract class CRUDUseCaseAsync<Domain extends BasicDomainObject>
    implements AbstractUseCase {
  //todo: example of definition
  ///Create the domain.
  Future<Domain> create(Domain newObject);

  ///Edit the domain.
  Future<Domain> edit(Domain objectToEdit);

  ///Destroy the domain.
  Future<void> delete(Domain objectToDestroy);

  ///Destroy the domain.
  Future<void> deleteById(int id);

  ///Find the correspondent domain by it's Key Id.
  Future<Domain?> findById(int keyId);

  ///Find all domains.
  Future<List<Domain>> findAll();

  ///Count the amount of domains.
  ///By default calling the length of findAll().
  Future<int> count() async {
    return findAll().then((value) => value.length);
  }

  Future<void> init();

  Future<void> dispose();
}
