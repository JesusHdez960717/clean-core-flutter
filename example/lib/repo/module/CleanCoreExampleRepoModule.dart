import 'package:clean_core_example/clean_core_example.dart';

class ObjectBoxExampleRepoModule {
  static late final ParentRepo PARENT_REPO;

  static bool init() {
    PARENT_REPO = ParentRepoImpl();
    return true;
  }
}
