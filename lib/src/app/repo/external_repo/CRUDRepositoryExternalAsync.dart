import 'package:clean_core/clean_core.dart';

///Default CRUD repository of type Entity extends [BasicEntityObject]
///for External Async operations.
///Implemented by the framework, the external library of persistence.
abstract class CRUDRepositoryExternalAsync<Entity extends BasicEntityObject>
    extends AbstractExternalRepo {//todo: example
  ///Create the domain.
  Future<Entity> create(Entity newObject);

  ///Edit the domain.
  Future<Entity> edit(Entity objectToEdit);

  ///Destroy the domain.
  Future<Entity> destroy(Entity objectToDestroy);

  ///Find the correspondent domain by it's Key Id.
  Future<Entity> findBy(int keyId);

  ///Find all domains.
  Future<List<Entity>> findAll();

  ///Count the amount of domains.
  ///By default calling the length of findAll().
  Future<int> count() async {
    return findAll().then((value) => value.length);
  }
}
