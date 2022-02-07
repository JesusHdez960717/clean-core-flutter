import 'package:clean_core/clean_core.dart';

//todo: example
//todo: doc
abstract class DefaultCRUDUseCaseAsync<Domain extends BasicDomainObject>
    extends CRUDUseCaseAsync<Domain> {
  CRUDRepositoryAsync<Domain> repo;

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
  Future<Domain> destroy(Domain objectToDestroy) async =>
      await repo.destroy(objectToDestroy);

  @override
  Future<void> init() async {}

  @override
  Future<void> dispose() async {}

  @override
  Future<int> count() => repo.count();
}
