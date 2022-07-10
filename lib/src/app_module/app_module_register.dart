import 'package:clean_core/clean_core.dart';

class AppModuleRegister {
  static List<AppModule> _modules = [];

  static register(AppModule module) {
    _modules.add(module);
  }

  static List<AppModule> modules() {
    return _modules;
  }

  static List<AppMainModule> mainModules() {
    return _modules.expand((element) => element.mainModules).toList();
  }

  static List<AppModuleInitScreen> initScreens() {
    return _modules.expand((element) => element.initScreen).toList();
  }

  static List<AppUtilModule> utils() {
    return _modules.expand((element) => element.utils).toList();
  }
}
