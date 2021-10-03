import 'package:clean_core/clean_core.dart';

mixin Converter<Domain extends BasicDomainObject> {
  Domain toDomain();
}
