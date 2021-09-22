import 'package:clean_core/flutter/app/repo/entity/AbstractCleanEntity.dart';
import 'package:clean_core/flutter/domain/AbstractCleanDomain.dart';

mixin Converter<Domain extends AbstractCleanDomain> {
  Domain toDomain();
}
