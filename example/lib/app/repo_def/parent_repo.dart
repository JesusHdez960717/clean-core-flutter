import 'package:clean_core/clean_core.dart';
import 'package:clean_core_example/clean_core_example.dart';

abstract class ParentRepo extends CRUDRepository<ParentDomain> {
  String doStuffDeeper();
}
