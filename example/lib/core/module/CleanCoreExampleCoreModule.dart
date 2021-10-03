import 'package:clean_core_example/clean_core_example.dart';

class ObjectBoxCoreModule {
  static late final ParentUseCase PARENT_USECASE;


  static Future<bool> init() async {
    bool initialized = await ObjectBoxExampleRepoModule.init().then((value) {
          PARENT_USECASE =
              ParentUseCaseImpl(ObjectBoxExampleRepoModule.PARENT_REPO);
        }) !=
        null;
    return initialized;
  }

  static void dispose() {
    ObjectBoxExampleRepoModule.dispose();
  }
}
