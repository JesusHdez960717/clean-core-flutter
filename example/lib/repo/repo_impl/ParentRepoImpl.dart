import 'package:clean_core/clean_core.dart';
import 'package:clean_core_example/clean_core_example.dart';

class ParentRepoImpl extends DefaultCRUDRepo<ParentDomain, ParentEntity>
    implements ParentRepo {
  late ParentRepoInternal _internal;

  ParentRepoImpl()
      : super(
            internalRepo: ParentRepoInternalImpl(),
            converter: ParentEntity.CONVERTER) {
    _internal = internalRepo as ParentRepoInternal;
  }

  @override
  String doStuffDeeper() {
    return "Doing Stuff Super deep, can go deeper";
  }
}
