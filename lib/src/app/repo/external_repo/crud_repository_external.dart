import 'package:clean_core/clean_core.dart';

///Default CRUD repository of type Entity extends [BasicEntityObject]
///for External operations.
///Implemented by the framework, the external library of persistence.
///
/// EXAMPLE://todo: change example External repo in clean-core example
/// ```dart
///   class ParentRepoExternal
///       extends ObjectBoxCRUDRepositoryExternal<ParentEntity> {
///     ParentRepoExternal(Store store) : super(store);
///   }
/// ```
abstract class CRUDRepositoryExternal<Entity extends BasicEntityObject>
    extends AbstractExternalRepo {
  ///Create the entity.
  Entity create(Entity newObject);

  ///Edit the entity.
  Entity edit(Entity objectToEdit);

  ///Destroy the entity.
  void destroy(Entity objectToDestroy);

  ///Destroy the entity by it's id.
  void destroyById(int id);

  ///Find the correspondent entity by it's Key Id.
  Entity findBy(int keyId);

  ///Find all entity.
  List<Entity> findAll();

  ///Count the amount of entity.
  ///By default calling the length of findAll().
  int count() {
    return findAll().length;
  }

  void init();

  void dispose();
}
