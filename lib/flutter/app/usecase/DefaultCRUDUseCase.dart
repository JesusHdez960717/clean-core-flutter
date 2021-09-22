import 'package:clean_core/flutter/app/usecase/CleanCoreUseCaseExporter.dart';
import 'package:clean_core/flutter/domain/CleanCoreDomainExporter.dart';

import '../repo/CRUDRespository.dart';

import '../PropertyChangeConstrains.dart';

abstract class DefaultCRUDUseCase<Domain extends BasicDomainObject>
    extends CRUDUseCase<Domain> {
  CRUDRespository<Domain> repo;

  DefaultCRUDUseCase({required this.repo});

  @override
  Domain create(Domain newObject) {
    print("${PropertyChangeConstrains.BEFORE_CREATE}  => $newObject");
    newObject = repo.create(newObject);
    print("${PropertyChangeConstrains.AFTER_CREATE}  => $newObject");
    return newObject;
  }

  @override
  Domain edit(Domain objectToEdit) {
    print("${PropertyChangeConstrains.BEFORE_EDIT}  => $objectToEdit");
    Domain domain = repo.edit(objectToEdit);
    print("${PropertyChangeConstrains.AFTER_EDIT}  => $objectToEdit");
    return domain;
  }

  @override
  List<Domain> findAll() {
    print("${PropertyChangeConstrains.BEFORE_FIND_ALL}  => EmptyList{}");
    List<Domain> list = repo.findAll();
    print("${PropertyChangeConstrains.AFTER_FIND_ALL}  => $list");
    return list;
  }

  @override
  Domain findBy(int keyId) {
    print("${PropertyChangeConstrains.BEFORE_FIND_BY}  => $keyId");
    Domain object = repo.findBy(keyId);
    print("${PropertyChangeConstrains.AFTER_FIND_BY}  => $keyId");
    return object;
  }

  @override
  Domain destroy(Domain objectToDestroy) {
    print("${PropertyChangeConstrains.BEFORE_DESTROY}  => $objectToDestroy");
    repo.destroy(objectToDestroy);
    print("${PropertyChangeConstrains.AFTER_DESTROY}  => $objectToDestroy");
    return objectToDestroy;
  }

  @override
  int count() {
    return repo.count();
  }
}
