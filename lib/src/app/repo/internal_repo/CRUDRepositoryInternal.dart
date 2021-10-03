import 'package:clean_core/clean_core.dart';

import 'AbstractInternalRepo.dart';

///Default CRUD repository of type Entity extends [BasicEntityObject]
///for internal operations.
///Implemented by the framework, the external library of persistence.
///
/// EXAMPLE://todo: change example internal repo in clean-core example
/// ```dart
///   class ParentRepoInternal
///       extends ObjectBoxCRUDRespositoryInternal<ParentEntity> {
///     ParentRepoInternal(Store store) : super(store);
///   }
/// ```
abstract class CRUDRepositoryInternal<Entity extends BasicEntityObject>
    extends AbstractInternalRepo {
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
