import 'package:clean_core/clean_core.dart';

import 'AbstractRespository.dart';

abstract class CRUDRespositoryInternal<Entity extends BasicEntityObject>
    extends AbstractRespository {
  Entity create(Entity newObject);

  Entity edit(Entity objectToEdit);

  Entity destroy(Entity objectToDestroy);

  Entity findBy(int keyId);

  List<Entity> findAll();

  int count() {
    return findAll().length;
  }
}
