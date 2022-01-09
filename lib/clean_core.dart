library clean_core;

import 'dart:async';

import 'package:flutter/services.dart';

export 'src/app/clean_app_exporter.dart';
export 'src/utils/repo_impl/repo_impl_exporter.dart';

class CleanCore {
  static const MethodChannel _channel = const MethodChannel('clean_core');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
