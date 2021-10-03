import 'package:clean_core/clean_core.dart';

class DefaultGeneralConverter<Domain extends BasicDomainObject,
        Entity extends BasicEntityObject<Domain>>
    extends GeneralConverter<Domain, Entity> {
  @override
  Domain toDomain(Entity entity) {
    return entity.toDomain();
  }

  @override
  Entity toEntity(Domain domain) {
    throw UnimplementedError("no se ha implementado"); //todo: implementar
  }

  @override
  List<Domain> toDomainAll(List<Entity> entities) =>
      entities.map((entity) => this.toDomain(entity)).toList();

  @override
  List<Entity> toEntityAll(List<Domain> domains) =>
      domains.map((domain) => this.toEntity(domain)).toList();
}
