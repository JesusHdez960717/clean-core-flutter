library clean_core;

export 'src/app/repo/entity/CleanCoreEntityExporter.dart';
export 'src/app/repo/CleanCoreRepoExporter.dart';
export 'src/app/usecase/CleanCoreUseCaseExporter.dart';
export 'src/app/domain/CleanCoreDomainExporter.dart';
export 'src/utils/repo_impl/InMemoryExternalCRUDRepo.dart';

import 'dart:async';

import 'package:flutter/services.dart';

class CleanCore {
  static const MethodChannel _channel = const MethodChannel('clean_core');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
