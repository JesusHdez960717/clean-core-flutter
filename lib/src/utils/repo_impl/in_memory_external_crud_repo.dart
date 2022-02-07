import 'package:clean_core/clean_core.dart';

class InMemoryExternalCRUDRepo<Entity extends BasicEntityObject>
    extends CRUDRepositoryExternal<Entity> {
  final Set<Entity> _list = {};
  int newID = 1;

  @override
  Entity create(Entity newObject) {
    newObject.id = newID++; //assign the new id to the new object
    _list.add(newObject);
    return newObject;
  }

  @override
  Entity edit(Entity objectToEdit) {
    if (objectToEdit.id == 0) {
      throw Exception("Can't edit en entity with id == 0");
    }
    destroy(objectToEdit);
    _list.add(objectToEdit);

    return objectToEdit;
  }

  @override
  List<Entity> findAll() => _list.toList(growable: false);

  @override
  Entity findBy(Object keyId) =>
      _list.firstWhere((element) => element.id == keyId);

  @override
  Entity destroy(Entity objectToDestroy) {
    _list.removeWhere((item) => item.id == objectToDestroy.id);

    return objectToDestroy;
  }

  @override
  int count() => _list.length;

  @override
  void dispose() {}

  @override
  void init() {}
}
