import 'package:clean_core/clean_core.dart';

//todo: example
//todo: doc
abstract class DefaultCRUDUseCaseAsync<Domain extends BasicDomainObject,
        CRUDRepo extends CRUDRepositoryAsync<Domain>>
    extends CRUDUseCaseAsync<Domain> {
  CRUDRepo repo;

  DefaultCRUDUseCaseAsync({required this.repo});

  @override
  Future<Domain> create(Domain newObject) async => await repo.create(newObject);

  @override
  Future<Domain> edit(Domain objectToEdit) async =>
      await repo.edit(objectToEdit);

  @override
  Future<List<Domain>> findAll() async => await repo.findAll();

  @override
  Future<Domain> findBy(int keyId) async => await repo.findBy(keyId);

  @override
  Future<void> destroy(Domain objectToDestroy) async =>
      await repo.destroy(objectToDestroy);

  @override
  Future<void> destroyById(int id) async => await repo.destroyById(id);

  @override
  Future<void> init() async {}

  @override
  Future<void> dispose() async {}

  @override
  Future<int> count() => repo.count();
}
