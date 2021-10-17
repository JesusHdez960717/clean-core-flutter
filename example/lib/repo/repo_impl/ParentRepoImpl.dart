import 'package:clean_core/clean_core.dart';
import 'package:clean_core_example/clean_core_example.dart';

class ParentRepoImpl extends DefaultCRUDRepo<ParentDomain, ParentEntity>
    implements ParentRepo {
  late ParentRepoExternal _External;

  ParentRepoImpl()
      : super(
            externalRepo: ParentRepoExternalImpl(),
            converter: ParentEntity.CONVERTER) {
    _External = externalRepo as ParentRepoExternal;
  }

  @override
  String doStuffDeeper() {
    return "Doing Stuff Super deep, can go deeper";
  }
}
