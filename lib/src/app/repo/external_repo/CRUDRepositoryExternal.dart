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
  ///Create the domain.
  Entity create(Entity newObject);

  ///Edit the domain.
  Entity edit(Entity objectToEdit);

  ///Destroy the domain.
  Entity destroy(Entity objectToDestroy);

  ///Find the correspondent domain by it's Key Id.
  Entity findBy(int keyId);

  ///Find all domains.
  List<Entity> findAll();

  ///Count the amount of domains.
  ///By default calling the length of findAll().
  int count() {
    return findAll().length;
  }
}
