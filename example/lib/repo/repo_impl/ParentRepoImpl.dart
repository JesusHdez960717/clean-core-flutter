import 'package:clean_core/clean_core.dart';
import 'package:clean_core_example/clean_core_example.dart';

class ParentRepoImpl extends DefaultCRUDRepo<ParentDomain, ParentEntity>
    implements ParentRepo {
  //late ParentRepoExternal _external;

  ParentRepoImpl()
      : super(
            externalRepo: ParentRepoExternalImpl(),
            converter: ParentEntity.parentConverter) {
    //_external = externalRepo as ParentRepoExternal;//in case of needed
  }

  @override
  String doStuffDeeper() {
    return "Doing Stuff Super deep, can go deeper";
  }
}
