import 'package:clean_core_example/clean_core_example.dart';

class ObjectBoxCoreModule {
  static late final ParentUseCase PARENT_USECASE;

  static bool init() {
    //init repo
    CleanCoreExampleRepoModule.init();

    PARENT_USECASE = ParentUseCaseImpl(CleanCoreExampleRepoModule.PARENT_REPO);

    return true;
  }
}
