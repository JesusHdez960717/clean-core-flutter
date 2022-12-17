import 'package:clean_core/clean_core.dart';

///Simplest of all entity's objects
///Entity that extends [EntityObject] with [IntIdentifier] and [Converter]<Domain>
///
/// EXAMPLE:
/// See [BasicDomainObject] for ParentDomain's example code.
/// ```dart
///   class ParentEntity extends BasicEntityObject {
///
///       int id;
///       String name;
///       DateTime bornDay;
///
///       ParentEntity({required this.name, this.id = 0, DateTime? date})
///           : bornDay = date ?? DateTime.now();
///   }
/// ```
abstract class BasicEntityObject extends EntityObject
    with IntIdentifier, Comparable<BasicEntityObject> {
  ///By default compare the two entities by it's id
  @override
  int compareTo(BasicEntityObject other) {
    return this.id.compareTo(other.id);
  }
}
