import 'package:clean_core/clean_core.dart';

///General converter entity <==> domain, it generalize and extract the
///conversion entity => domain & domain => entity in a single isolated class
///
/// See [DefaultGeneralConverter] for simple implementation example
abstract class GeneralConverter<Domain extends BasicDomainObject,
    Entity extends BasicEntityObject> {
  ///Convert entity into domain.
  Domain toDomain(Entity entity);

  ///Convert domain into entity.
  Entity toEntity(Domain domain);

  ///Convert a list of entities into a list of domain.
  List<Domain> toDomainAll(List<Entity> entities);

  ///Convert a list of domain into a list of entities .
  List<Entity> toEntityAll(List<Domain> domains);
}
