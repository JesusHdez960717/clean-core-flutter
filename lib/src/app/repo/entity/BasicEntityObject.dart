import 'package:clean_core/clean_core.dart';

///Simplest of all entity's objects
///Entity that extends [EntityObject] with [IntIdentifier] and [Converter]<Domain>
///
/// EXAMPLE:
/// See [BasicDomainObject] for ParentDomain's example code.
/// ```dart
///   class ParentEntity extends BasicEntityObject<ParentDomain> {
///       static final ParentConverter CONVERTER = ParentConverter();
///
///       int id;
///       String name;
///       DateTime bornDay;
///
///       ParentEntity.fromDomain(ParentDomain domain)
///           : id = domain.id,
///           name = domain.name,
///           bornDay = domain.bornDay;
///
///       //this is the one to use
///       ParentEntity.build({required this.name, this.id = 0, DateTime? date})
///           : bornDay = date ?? DateTime.now();
///
///       @override
///       ParentDomain toDomain() {
///         return ParentDomain(id: id, name: name, bornDay: bornDay);
///       }
///   }
/// ```
abstract class BasicEntityObject<Domain extends BasicDomainObject>
    extends EntityObject with IntIdentifier, Converter<Domain> {}
