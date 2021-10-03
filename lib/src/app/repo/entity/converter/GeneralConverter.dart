import 'package:clean_core/clean_core.dart';

abstract class GeneralConverter<Domain extends BasicDomainObject,
    Entity extends BasicEntityObject<Domain>> {
  Domain toDomain(Entity entity);

  Entity toEntity(Domain domain);

  List<Domain> toDomainAll(List<Entity> entities);

  List<Entity> toEntityAll(List<Domain> domains);
}
