import 'package:clean_core_example/clean_core_example.dart';

class CleanCoreExampleRepoModule {
  static late final ParentRepo parentRepo;

  static bool init() {
    parentRepo = ParentRepoImpl();
    return true;
  }
}
