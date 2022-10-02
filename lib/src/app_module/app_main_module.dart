import 'package:flutter/material.dart';

class AppMainModule {
  String moduleName;
  IconData moduleIcon;
  Widget moduleHomePage;

  AppMainModule({
    required this.moduleName,
    this.moduleIcon = Icons.broken_image,
    required this.moduleHomePage,
  });
}
