import 'package:clean_core/src/app_module/app_module_init_screen.dart';
import 'package:clean_core/src/app_module/app_util_module.dart';

class AppModule {
  List<AppModule> mainModules;
  List<AppModuleInitScreen> initScreen;
  List<AppUtilModule> utils;

  AppModule({
    this.mainModules = const [],
    this.initScreen = const [],
    this.utils = const [],
  });
}
