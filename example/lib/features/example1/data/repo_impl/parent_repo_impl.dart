import 'package:clean_core/clean_core.dart';
import 'package:clean_core_example/clean_core_example.dart';

class ParentRepoImpl
    extends DelegatedCRUDRepo<ParentDomain, ParentEntity, ParentFrameworkRepo>
    implements ParentRepo {
  ParentRepoImpl()
      : super(
          externalRepo: ParentFrameworkRepoImpl(),
          converter: ParentConverter.converter,
        );

  @override
  String doStuffDeeper() {
    return "Doing Stuff Super deep, can go deeper";
  }
}
