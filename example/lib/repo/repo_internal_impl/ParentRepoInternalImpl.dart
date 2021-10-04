import 'package:clean_core/clean_core.dart';
import 'package:clean_core_example/clean_core_example.dart';

class ParentRepoInternalImpl extends InMemoryInternalCRUDRepo<ParentEntity>
    implements ParentRepoInternal {


  @override
  ParentEntity destroy(ParentEntity objectToDestroy) {
    super.destroy(objectToDestroy);
    return objectToDestroy;
  }
}
