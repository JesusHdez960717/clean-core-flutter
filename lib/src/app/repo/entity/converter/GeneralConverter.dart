import 'package:clean_core/flutter/app/repo/entity/CleanCoreEntityExporter.dart';
import 'package:clean_core/flutter/domain/CleanCoreDomainExporter.dart';

abstract class GeneralConverter<Domain extends BasicDomainObject,
    Entity extends BasicEntityObject<Domain>> {
  Domain toDomain(Entity entity);

  Entity toEntity(Domain domain);

  List<Domain> toDomainAll(List<Entity> entities);

  List<Entity> toEntityAll(List<Domain> domains);
}
