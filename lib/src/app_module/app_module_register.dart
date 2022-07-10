import 'package:clean_core/src/app_module/app_module.dart';

class AppModuleRegister {
  static List<AppModule> _modules = [];

  static register(AppModule module) {
    _modules.add(module);
  }

  static List<AppModule> modules() {
    return _modules;
  }
}
