import 'package:clean_core/clean_core.dart';

///Default implementation of [GeneralConverter]
///
/// EXAMPLE:
/// See [BasicEntityObject] for ParentEntity's example code
/// See [BasicDomainObject] for ParentDomain's example code
///
/// ```dart
/// class ParentConverter
///     extends DefaultGeneralConverter<ParentDomain, ParentEntity> {
///   @override
///   ParentDomain toDomain(ParentEntity entity) {
///     return ParentDomain(
///         name: entity.name, bornDay: entity.bornDay, id: entity.id);
///   }
///
///   @override
///   ParentEntity toEntity(ParentDomain domain) {
///     return ParentEntity(domain.name, domain.bornDay, id: domain.id);
///   }
/// }
/// ```
///
class DefaultGeneralConverter<Domain extends BasicDomainObject,
    Entity extends BasicEntityObject> extends GeneralConverter<Domain, Entity> {
  @override
  Domain toDomain(Entity entity) {
    throw UnimplementedError("no se ha implementado"); //todo: implement
  }

  @override
  Entity toEntity(Domain domain) {
    throw UnimplementedError("no se ha implementado"); //todo: implement
  }

  ///By default converting one by one into a new list
  ///using the single toDomain(entity) converter.
  @override
  List<Domain> toDomainAll(List<Entity> entities) =>
      entities.map((entity) => this.toDomain(entity)).toList();

  ///By default converting one by one into a new list
  ///using the single toEntity(domain) converter.
  @override
  List<Entity> toEntityAll(List<Domain> domains) =>
      domains.map((domain) => this.toEntity(domain)).toList();
}
