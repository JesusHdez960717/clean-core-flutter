import 'package:clean_core/clean_core.dart';

/// Mixin to implement by an Entity in order to convert it to it's correspondent domain.
/// Generally NOT implemented directly, instead extends the entity from [BasicEntityObject].
mixin Converter<Domain extends BasicDomainObject> {
  ///Convert the current entity to it's correspondent domain.
  Domain toDomain();
}
