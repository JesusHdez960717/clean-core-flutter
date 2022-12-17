import 'package:clean_core/clean_core.dart';

import 'package:clean_core_example/clean_core_example.dart';

abstract class ParentUseCase extends CRUDUseCase<ParentDomain> {
  String doStuffInUseCase();

  String doStuffDeeper();
}
