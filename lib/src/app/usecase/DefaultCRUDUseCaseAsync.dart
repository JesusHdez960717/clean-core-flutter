import 'package:clean_core/flutter/app/repo/CleanCoreRepoExporter.dart';
import 'package:clean_core/flutter/app/usecase/CleanCoreUseCaseExporter.dart';
import 'package:clean_core/flutter/domain/CleanCoreDomainExporter.dart';

import '../PropertyChangeConstrains.dart';

abstract class DefaultCRUDUseCaseAsync<Domain extends BasicDomainObject>
    extends CRUDUseCaseAsync<Domain> {
  CRUDRespositoryAsync<Domain> repo;

  DefaultCRUDUseCaseAsync({required this.repo});

  @override
  Future<Domain> create(Domain newObject) async {
    print("${PropertyChangeConstrains.BEFORE_CREATE}  => $newObject");
    newObject = await repo.create(newObject);
    print("${PropertyChangeConstrains.AFTER_CREATE}  => $newObject");
    return newObject;
  }

  @override
  Future<Domain> edit(Domain objectToEdit) async {
    print("${PropertyChangeConstrains.BEFORE_EDIT}  => $objectToEdit");
    Domain domain = await repo.edit(objectToEdit);
    print("${PropertyChangeConstrains.AFTER_EDIT}  => $objectToEdit");
    return domain;
  }

  @override
  Future<List<Domain>> findAll() async {
    print("${PropertyChangeConstrains.BEFORE_FIND_ALL}  => EmptyList{}");
    List<Domain> list = await repo.findAll();
    print("${PropertyChangeConstrains.AFTER_FIND_ALL}  => $list");
    return list;
  }

  @override
  Future<Domain> findBy(int keyId) async {
    print("${PropertyChangeConstrains.BEFORE_FIND_BY}  => $keyId");
    Domain object = await repo.findBy(keyId);
    print("${PropertyChangeConstrains.AFTER_FIND_BY}  => $keyId");
    return object;
  }

  @override
  Future<Domain> destroy(Domain objectToDestroy) async {
    print("${PropertyChangeConstrains.BEFORE_DESTROY}  => $objectToDestroy");
    objectToDestroy = await repo.destroy(objectToDestroy);
    print("${PropertyChangeConstrains.AFTER_DESTROY}  => $objectToDestroy");
    return objectToDestroy;
  }

  @override
  Future<int> count() {
    return repo.count();
  }
}
