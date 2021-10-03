import 'package:clean_core/clean_core.dart';

///Simplest of all entity's objects
///Entity that extends [DomainObject] with [IntIdentifier]
///
/// See [BasicEntityObject] for ParentEntity's example code.
/// EXAMPLE:
///   class ParentDomain extends BasicDomainObject {
///     int id;
///     String name;
///     DateTime bornDay;
///
///     ParentDomain({required this.name, required this.bornDay, this.id = 0});
///
///     String get bornDayFormat => DateFormat.yMMMd().format(bornDay);
///
///     @override
///     String toString() {
///       return 'ParentDomain{name: $name}';
///     }
///   }
///
abstract class BasicDomainObject extends DomainObject with IntIdentifier {}
