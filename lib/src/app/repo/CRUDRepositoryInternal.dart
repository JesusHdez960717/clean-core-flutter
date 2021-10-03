import 'package:clean_core/clean_core.dart';

import 'AbstractRepository.dart';

abstract class CRUDRepositoryInternal<Entity extends BasicEntityObject>
    extends AbstractRepository {
  Entity create(Entity newObject);

  Entity edit(Entity objectToEdit);

  Entity destroy(Entity objectToDestroy);

  Entity findBy(int keyId);

  List<Entity> findAll();

  int count() {
    return findAll().length;
  }
}
