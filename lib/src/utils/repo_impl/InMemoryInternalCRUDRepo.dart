import 'package:clean_core/clean_core.dart';

class InMemoryInternalCRUDRepo<Entity extends BasicEntityObject>
    extends CRUDRepositoryInternal<Entity> {
  final Set<Entity> _list = {};
  int newID = 1;

  @override
  Entity create(Entity newObject) {
    ///fire property change listener BEFORE_CREATE
    print("${PropertyChangeConstrains.BEFORE_CREATE}  => $newObject");

    newObject.id = newID++; //assign the new id to the new object
    _list.add(newObject);

    ///fire property change listener AFTER_CREATE
    print("${PropertyChangeConstrains.AFTER_CREATE}  => $newObject");

    return newObject;
  }

  @override
  Entity edit(Entity objectToEdit) {
    ///fire property change listener BEFORE_EDIT
    print("${PropertyChangeConstrains.BEFORE_EDIT}  => $objectToEdit");

    if (objectToEdit.id == 0) {
      throw new Exception("Can't edit en entity with id == 0");
    }
    destroy(objectToEdit);
    _list.add(objectToEdit);

    ///fire property change listener AFTER_EDIT
    print("${PropertyChangeConstrains.AFTER_EDIT}  => $objectToEdit");

    return objectToEdit;
  }

  @override
  List<Entity> findAll() {
    ///fire property change listener BEFORE_FIND_ALL. Allways an EmptyList{}
    print("${PropertyChangeConstrains.BEFORE_FIND_ALL}  => EmptyList{}");

    List<Entity> list = _list.toList(growable: false);

    ///fire property change listener AFTER_EDIT
    print("${PropertyChangeConstrains.AFTER_FIND_ALL}  => $list");

    return list;
  }

  @override
  Entity findBy(Object keyId) {
    ///fire property change listener BEFORE_FIND_BY
    print("${PropertyChangeConstrains.BEFORE_FIND_BY}  => $keyId");

    List<Entity> l = _list.toList();
    l.removeWhere((element) => element.id != keyId);

    Entity object = l[0];

    ///fire property change listener AFTER_FIND_BY
    print("${PropertyChangeConstrains.AFTER_FIND_BY}  => $keyId");

    return object;
  }

  @override
  Entity destroy(Entity objectToDestroy) {
    ///fire property change listener BEFORE_DESTROY
    print("${PropertyChangeConstrains.BEFORE_DESTROY}  => $objectToDestroy");

    _list.removeWhere((item) => item.id == objectToDestroy.id);

    ///fire property change listener AFTER_DESTROY
    print("${PropertyChangeConstrains.AFTER_DESTROY}  => $objectToDestroy");

    return objectToDestroy;
  }

  @override
  int count() {
    return _list.length;
  }
}
