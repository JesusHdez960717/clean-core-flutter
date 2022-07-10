import 'package:flutter/material.dart';

class AppMainModule {
  String moduleName;
  IconData moduleIcon;
  String moduleHomePageRouteName;

  AppMainModule({
    required this.moduleName,
    this.moduleIcon = Icons.broken_image,
    required this.moduleHomePageRouteName,
  });
}
