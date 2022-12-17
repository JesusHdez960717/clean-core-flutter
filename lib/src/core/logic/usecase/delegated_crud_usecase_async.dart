import 'package:clean_core/clean_core.dart';

//todo: example
//todo: doc
abstract class DelegatedCRUDUseCaseAsync<Domain extends BasicDomainObject,
        CRUDRepo extends CRUDRepositoryAsync<Domain>>
    extends CRUDUseCaseAsync<Domain> {
  CRUDRepo repo;

  DelegatedCRUDUseCaseAsync({required this.repo});

  @override
  Future<Domain> create(Domain newObject) async => repo.create(newObject);

  @override
  Future<Domain> edit(Domain objectToEdit) async => repo.edit(objectToEdit);

  @override
  Future<List<Domain>> findAll() async => repo.findAll();

  @override
  Future<Domain?> findById(int keyId) async => repo.findById(keyId);

  @override
  Future<void> delete(Domain objectToDestroy) async =>
      await repo.delete(objectToDestroy);

  @override
  Future<void> deleteById(int id) async => repo.deleteById(id);

  @override
  Future<void> init() async {}

  @override
  Future<void> dispose() async {}

  @override
  Future<int> count() => repo.count();
}
