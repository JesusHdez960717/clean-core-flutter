import 'package:clean_core_example/clean_core_example.dart';

class CleanCoreExample1Module {
  static late final ParentUseCase parentUseCase;

  static bool init() {
    //init repo
    ParentRepo parentRepo = ParentRepoImpl();

    //init UC
    parentUseCase = ParentUseCaseImpl(parentRepo);

    return true;
  }
}
