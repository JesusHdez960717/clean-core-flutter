import 'package:clean_core/flutter/app/repo/CleanCoreRepoExporter.dart';
import 'package:clean_core/flutter/app/usecase/CleanCoreUseCaseExporter.dart';
import 'package:clean_core/flutter/domain/CleanCoreDomainExporter.dart';

import '../PropertyChangeConstrains.dart';

abstract class DefaultCRUDUseCaseAsync<T extends BasicDomainObject>
    extends CRUDUseCaseAsync<T> {
  CRUDRespositoryAsync<T> repo;

  DefaultCRUDUseCaseAsync({required this.repo});

  @override
  Future<T> create(T newObject) async {
    print("${PropertyChangeConstrains.BEFORE_CREATE}  => $newObject");
    newObject = await repo.create(newObject);
    print("${PropertyChangeConstrains.AFTER_CREATE}  => $newObject");
    return newObject;
  }

  @override
  Future<List<T>> findAll() async {
    print("${PropertyChangeConstrains.BEFORE_FIND_ALL}  => EmptyList{}");
    List<T> list = await repo.findAll();
    print("${PropertyChangeConstrains.AFTER_FIND_ALL}  => $list");
    return list;
  }

  @override
  Future<T> findBy(Object keyId) async {
    print("${PropertyChangeConstrains.BEFORE_FIND_BY}  => $keyId");
    T object = await repo.findBy(keyId);
    print("${PropertyChangeConstrains.AFTER_FIND_BY}  => $keyId");
    return object;
  }

  @override
  Future<T> destroy(T objectToDestroy) async {
    print("${PropertyChangeConstrains.BEFORE_DESTROY}  => $objectToDestroy");
    objectToDestroy = await repo.destroy(objectToDestroy);
    print("${PropertyChangeConstrains.AFTER_DESTROY}  => $objectToDestroy");
    return objectToDestroy;
  }

  @override
  Future<T> edit(T objectToEdit) async {
    print("${PropertyChangeConstrains.BEFORE_EDIT}  => $objectToEdit");
    T domain = await repo.update(objectToEdit);
    print("${PropertyChangeConstrains.AFTER_EDIT}  => $objectToEdit");
    return domain;
  }

  @override
  Future<int> count() {
    return repo.count();
  }
}
