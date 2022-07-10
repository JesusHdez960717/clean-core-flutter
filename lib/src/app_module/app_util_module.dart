import 'package:flutter/material.dart';

class AppUtilModule {
  String utilName;
  IconData utilIcon;
  String utilPageRouteName;

  AppUtilModule({
    required this.utilName,
    this.utilIcon = Icons.broken_image,
    required this.utilPageRouteName,
  });
}
