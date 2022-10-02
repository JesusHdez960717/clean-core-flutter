import 'clean_app_module_exporter.dart';

class AppModule {
  List<AppMainModule> mainModules;
  List<AppModuleInitScreen> initScreen;
  List<AppUtilModule> utils;

  AppModule({
    this.mainModules = const [],
    this.initScreen = const [],
    this.utils = const [],
  });
}
