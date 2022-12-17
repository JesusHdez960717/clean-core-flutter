import 'package:clean_core/clean_core.dart';

class InMemoryExternalCRUDRepo<Entity extends BasicEntityObject>
    extends CRUDRepositoryFramework<Entity> {
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
    delete(objectToEdit);
    _list.add(objectToEdit);

    return objectToEdit;
  }

  @override
  List<Entity> findAll() => _list.toList(growable: false);

  @override
  Entity? findById(Object keyId) =>
      _list.firstWhere((element) => element.id == keyId);

  @override
  void delete(Entity objectToDestroy) {
    _list.removeWhere((item) => item.id == objectToDestroy.id);
  }

  @override
  void deleteById(int id) {
    _list.removeWhere((item) => item.id == id);
  }

  @override
  int count() => _list.length;

  @override
  void dispose() {}

  @override
  void init() {}
}
