library clean_core;

import 'dart:async';

import 'package:flutter/services.dart';

export 'src/core/clean_core_exporter.dart';
export 'src/app_module/clean_app_module_exporter.dart';
export 'src/utils/clean_core_utils_exporter.dart';

class CleanCore {
  static const MethodChannel _channel = const MethodChannel('clean_core');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
