import 'package:clean_core/clean_core.dart';
import 'package:clean_core_example/clean_core_example.dart';

class ParentRepoExternalImpl extends InMemoryExternalCRUDRepo<ParentEntity>
    implements ParentRepoExternal {
  @override
  ParentEntity destroy(ParentEntity objectToDestroy) {
    super.destroy(objectToDestroy);
    return objectToDestroy;
  }
}
