import 'package:clean_core_example/clean_core_example.dart';

class CleanCoreExampleCoreModule {
  static late final ParentUseCase parentUseCase;

  static bool init() {
    //init repo
    CleanCoreExampleRepoModule.init();

    parentUseCase = ParentUseCaseImpl(CleanCoreExampleRepoModule.parentRepo);

    return true;
  }
}
