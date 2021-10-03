import 'package:clean_core/flutter/domain/CleanCoreDomainExporter.dart';

import 'AbstractUseCase.dart';

abstract class CRUDUseCaseAsync<Domain extends BasicDomainObject>
    implements AbstractUseCase {
  Future<Domain> create(Domain newObject);

  Future<Domain> edit(Domain objectToEdit);

  Future<Domain> destroy(Domain objectToDestroy);

  Future<Domain> findBy(int keyId);

  Future<List<Domain>> findAll();

  Future<int> count() async {
    return findAll().then((value) => value.length);
  }
}
