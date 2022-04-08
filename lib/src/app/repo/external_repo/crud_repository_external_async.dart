import 'package:clean_core/clean_core.dart';

///Default CRUD repository of type Entity extends [BasicEntityObject]
///for External Async operations.
///Implemented by the framework, the external library of persistence.
abstract class CRUDRepositoryExternalAsync<Entity extends BasicEntityObject>
    extends AbstractExternalRepo {
  //todo: example
  ///Create the entity.
  Future<Entity> create(Entity newObject);

  ///Edit the entity.
  Future<Entity> edit(Entity objectToEdit);

  ///Destroy the entity.
  Future<void> destroy(Entity objectToDestroy);

  ///Destroy the entity by it's id.
  Future<void> destroyById(int id);

  ///Find the correspondent entity by it's Key Id.
  Future<Entity> findBy(int keyId);

  ///Find all entities.
  Future<List<Entity>> findAll();

  ///Count the amount of domains.
  ///By default calling the length of findAll().
  Future<int> count() async {
    return findAll().then((value) => value.length);
  }

  Future<void> init() async {}

  Future<void> dispose() async {}
}
