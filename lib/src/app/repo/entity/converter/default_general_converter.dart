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
///     return entity.toDomain();
///   }
///
///   @override
///   ParentEntity toEntity(ParentDomain domain) {
///     return ParentEntity.fromDomain(domain);
///   }
/// }
/// ```
///
class DefaultGeneralConverter<Domain extends BasicDomainObject,
        Entity extends BasicEntityObject<Domain>>
    extends GeneralConverter<Domain, Entity> {
  ///By default calling Entity.toDomain()
  @override
  Domain toDomain(Entity entity) {
    return entity.toDomain();
  }

  ///By default ....
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
