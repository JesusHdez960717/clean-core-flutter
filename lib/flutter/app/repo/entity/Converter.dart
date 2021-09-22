import 'package:clean_core/flutter/domain/CleanCoreDomainExporter.dart';

mixin Converter<Domain extends BasicDomainObject> {
  Domain toDomain();
}
