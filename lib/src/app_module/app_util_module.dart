import 'package:flutter/material.dart';

class AppUtilModule {
  String utilName;
  IconData utilIcon;
  Widget utilPage;

  AppUtilModule({
    required this.utilName,
    this.utilIcon = Icons.broken_image,
    required this.utilPage,
  });
}
