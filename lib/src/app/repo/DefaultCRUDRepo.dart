import 'package:clean_core/clean_core.dart';

import '../PropertyChangeConstrains.dart';
import 'internal_repo/CRUDRepositoryInternal.dart';

///Default implementation of CRUDRepository of type Domain extends
///[BasicDomainObject] & Entity extends [BasicEntityObject<Domain>]
///It's basically a delegate to the internal repo.
abstract class DefaultCRUDRepo<Domain extends BasicDomainObject,
    Entity extends BasicEntityObject<Domain>> extends CRUDRepository<Domain> {
  ///internal repo, the one who really do the operations.
  CRUDRepositoryInternal<Entity> internalRepo;

  GeneralConverter<Domain, Entity> converter;

  DefaultCRUDRepo({required this.internalRepo, required this.converter});

  @override
  Domain create(Domain newObject) {
    print("${PropertyChangeConstrains.BEFORE_CREATE}  => $newObject");

    //convert domain to entity to be compatible with internal repo
    Entity entityToCreate = converter.toEntity(newObject);

    //do the persist
    Entity entityCreated = internalRepo.create(entityToCreate); //do persist

    //convert back the entity persisted to the domain
    newObject = converter.toDomain(entityCreated);

    print("${PropertyChangeConstrains.AFTER_CREATE}  => $newObject");
    return newObject;
  }

  @override
  Domain edit(Domain objectToEdit) {
    print("${PropertyChangeConstrains.BEFORE_EDIT}  => $objectToEdit");

    //convert domain to entity to be compatible with internal repo
    Entity entityToEdit = converter.toEntity(objectToEdit);

    //do the update
    Entity entityEdited = internalRepo.edit(entityToEdit); //do edit

    //convert back the entity edited to the domain
    objectToEdit = converter.toDomain(entityEdited);

    print("${PropertyChangeConstrains.AFTER_EDIT}  => $objectToEdit");
    return objectToEdit;
  }

  @override
  List<Domain> findAll() {
    print("${PropertyChangeConstrains.BEFORE_FIND_ALL}  => EmptyList{}");

    //find all entities
    List<Entity> entityList = internalRepo.findAll();

    //convert all entities to domains
    List<Domain> domainList = converter.toDomainAll(entityList);

    print("${PropertyChangeConstrains.AFTER_FIND_ALL}  => $domainList");
    return domainList;
  }

  @override
  Domain findBy(int keyId) {
    print("${PropertyChangeConstrains.BEFORE_FIND_BY}  => $keyId");

    //find the entity
    Entity entityFounded = internalRepo.findBy(keyId);

    //convert entity to domain
    Domain domainFounded = converter.toDomain(entityFounded);

    print("${PropertyChangeConstrains.AFTER_FIND_BY}  => $keyId");
    return domainFounded;
  }

  @override
  Domain destroy(Domain objectToDestroy) {
    print("${PropertyChangeConstrains.BEFORE_DESTROY}  => $objectToDestroy");

    //convert the objectToDestroy into entity
    Entity entityToDestroy = converter.toEntity(objectToDestroy);

    //destroy the entity
    Entity entityDestroyed = internalRepo.destroy(entityToDestroy);

    objectToDestroy = converter.toDomain(entityDestroyed);

    print("${PropertyChangeConstrains.AFTER_DESTROY}  => $objectToDestroy");
    return objectToDestroy;
  }

  @override
  int count() {
    return internalRepo.count();
  }
}
