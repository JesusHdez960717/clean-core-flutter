import 'package:clean_core/clean_core.dart';

import '../PropertyChangeConstrains.dart';
import 'internal_repo/CRUDRepositoryInternal.dart';

///Default implementation of [CRUDRepository] of type Domain extends
///[BasicDomainObject] & Entity extends [BasicEntityObject]<Domain>
///It's basically a delegate to the internal repo.
///
/// EXAMPLE:
/// This is the implementation of ParentRepo.
/// See [BasicDomainObject] for ParentDomain's example code.
/// See [BasicEntityObject] for ParentEntity's example code.
/// See [CRUDRepository] for ParentRepo's example code.
/// ```dart
///   class ParentRepoImpl extends DefaultCRUDRepo<ParentDomain, ParentEntity>
///       implements ParentRepo {
///       @override
///       void doStuff(){print('Doing Stuff...');}
///   }
/// ```
abstract class DefaultCRUDRepo<Domain extends BasicDomainObject,
    Entity extends BasicEntityObject<Domain>> extends CRUDRepository<Domain> {
  //todo: property change listener
  ///Internal repo, the one who really do the operations.
  CRUDRepositoryInternal<Entity> internalRepo;

  ///Converter of this repo, hadler of transaction domain <==> entity
  GeneralConverter<Domain, Entity> converter;

  ///Default Constructor
  DefaultCRUDRepo({required this.internalRepo, required this.converter});

  ///Create the domain
  ///Return the domain after been persisted, the returned domain have the
  ///properties assigned by the repo, like the new id.
  @override
  Domain create(Domain newObject) {
    ///fire property change listener BEFORE_CREATE
    print("${PropertyChangeConstrains.BEFORE_CREATE}  => $newObject");

    ///convert domain to entity to be compatible with internal repo
    Entity entityToCreate = converter.toEntity(newObject);

    ///do the persist
    Entity entityCreated = internalRepo.create(entityToCreate); //do persist

    ///convert back the entity persisted to the domain
    newObject = converter.toDomain(entityCreated);

    ///fire property change listener AFTER_CREATE
    print("${PropertyChangeConstrains.AFTER_CREATE}  => $newObject");
    return newObject;
  }

  ///Edit the domain
  @override
  Domain edit(Domain objectToEdit) {
    ///fire property change listener BEFORE_EDIT
    print("${PropertyChangeConstrains.BEFORE_EDIT}  => $objectToEdit");

    ///convert domain to entity to be compatible with internal repo
    Entity entityToEdit = converter.toEntity(objectToEdit);

    ///do the update
    Entity entityEdited = internalRepo.edit(entityToEdit); //do edit

    ///convert back the entity edited to the domain
    objectToEdit = converter.toDomain(entityEdited);

    ///fire property change listener AFTER_EDIT
    print("${PropertyChangeConstrains.AFTER_EDIT}  => $objectToEdit");

    return objectToEdit;
  }

  ///Find all domains
  @override
  List<Domain> findAll() {
    ///fire property change listener BEFORE_FIND_ALL. Allways an EmptyList{}
    print("${PropertyChangeConstrains.BEFORE_FIND_ALL}  => EmptyList{}");

    ///find all entities
    List<Entity> entityList = internalRepo.findAll();

    ///convert all entities to domains
    List<Domain> domainList = converter.toDomainAll(entityList);

    ///fire property change listener AFTER_EDIT
    print("${PropertyChangeConstrains.AFTER_FIND_ALL}  => $domainList");

    return domainList;
  }

  ///Find the correspondent domain by it's Key Id.
  @override
  Domain findBy(int keyId) {
    ///fire property change listener BEFORE_FIND_BY
    print("${PropertyChangeConstrains.BEFORE_FIND_BY}  => $keyId");

    ///find the entity
    Entity entityFounded = internalRepo.findBy(keyId);

    ///convert entity to domain
    Domain domainFounded = converter.toDomain(entityFounded);

    ///fire property change listener AFTER_FIND_BY
    print("${PropertyChangeConstrains.AFTER_FIND_BY}  => $keyId");
    return domainFounded;
  }

  ///Destroy the domain.
  @override
  Domain destroy(Domain objectToDestroy) {
    ///fire property change listener BEFORE_DESTROY
    print("${PropertyChangeConstrains.BEFORE_DESTROY}  => $objectToDestroy");

    ///convert the objectToDestroy into entity
    Entity entityToDestroy = converter.toEntity(objectToDestroy);

    ///destroy the entity
    Entity entityDestroyed = internalRepo.destroy(entityToDestroy);

    ///convert the entity back to it's domain
    objectToDestroy = converter.toDomain(entityDestroyed);

    ///fire property change listener AFTER_DESTROY
    print("${PropertyChangeConstrains.AFTER_DESTROY}  => $objectToDestroy");
    return objectToDestroy;
  }

  ///Count the amount of domains.
  @override
  int count() {
    return internalRepo.count();
  }
}
