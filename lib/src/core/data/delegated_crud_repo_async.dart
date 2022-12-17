import 'package:clean_core/clean_core.dart';

///Default implementation of [CRUDRepository] of type Domain extends
///[BasicDomainObject] & Entity extends [BasicEntityObject]<Domain>
///It's basically a delegate to the External repo.
///
/// EXAMPLE:
/// This is the implementation of ParentRepo.
/// See [BasicDomainObject] for ParentDomain's example code.
/// See [BasicEntityObject] for ParentEntity's example code.
/// See [CRUDRepository] for ParentRepo's example code.
/// ```dart
///   class ParentRepoImpl extends DefaultCRUDRepoAsync<ParentDomain, ParentEntity>
///       implements ParentRepo {
///       @override
///       void doStuffInRepo(){
///         print('Doing Stuff in the repository layer...');
///       }
///   }
/// ```
abstract class DelegatedCRUDRepoAsync<
        Domain extends BasicDomainObject,
        Entity extends BasicEntityObject,
        ExternalRepo extends CRUDRepositoryFrameworkAsync<Entity>>
    extends CRUDRepositoryAsync<Domain> {
  ///External repo, the one who really do the operations.
  ExternalRepo externalRepo;

  ///Converter of this repo, hadler of transaction domain <==> entity
  GeneralConverter<Domain, Entity> converter;

  ///Default Constructor
  DelegatedCRUDRepoAsync({required this.externalRepo, required this.converter});

  ///Create the domain
  ///Return the domain after been persisted, the returned domain have the
  ///properties assigned by the repo, like the new id.
  @override
  Future<Domain> create(Domain newObject) async {
    ///convert domain to entity to be compatible with External repo
    Entity entityToCreate = converter.toEntity(newObject);

    ///do the persist
    Entity entityCreated =
        await externalRepo.create(entityToCreate); //do persist

    ///convert back the entity persisted to the domain
    newObject = converter.toDomain(entityCreated);

    return newObject;
  }

  ///Edit the domain
  @override
  Future<Domain> edit(Domain objectToEdit) async {
    ///convert domain to entity to be compatible with External repo
    Entity entityToEdit = converter.toEntity(objectToEdit);

    ///do the update
    Entity entityEdited = await externalRepo.edit(entityToEdit); //do edit

    ///convert back the entity edited to the domain
    objectToEdit = converter.toDomain(entityEdited);

    return objectToEdit;
  }

  ///Find all domains
  @override
  Future<List<Domain>> findAll() async {
    ///find all entities
    List<Entity> entityList = await externalRepo.findAll();

    ///convert all entities to domains
    List<Domain> domainList = converter.toDomainAll(entityList);

    return domainList;
  }

  ///Find the correspondent domain by it's Key Id.
  @override
  Future<Domain?> findById(int keyId) async {
    ///find the entity
    Entity? entityFounded = await externalRepo.findById(keyId);

    ///convert entity to domain
    return entityFounded == null ? null : converter.toDomain(entityFounded);
  }

  ///Destroy the domain.
  @override
  Future<void> delete(Domain objectToDestroy) async {
    ///convert the objectToDestroy into entity
    Entity entityToDestroy = converter.toEntity(objectToDestroy);

    ///destroy the entity
    await externalRepo.delete(entityToDestroy);
  }

  ///Destroy the domain.
  @override
  Future<void> deleteById(int id) async {
    ///destroy the entity
    await externalRepo.deleteById(id);
  }

  ///Count the amount of domains.
  @override
  Future<int> count() async => await externalRepo.count();

  @override
  Future<void> init() async {}

  @override
  Future<void> dispose() async {}
}
