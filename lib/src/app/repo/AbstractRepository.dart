import 'package:clean_core/clean_core.dart';

///Abstract repository, it defines a type.
///
/// Responsibility:
/// It's in charge of making the transition from the UseCase and the Persistence
/// framework, it handles the conversion entity => domain & domain => entity.
/// This is the layer where data is cypher in case of needed, conversion,
/// formatting, date translation ...
///
/// See [CRUDRepository] for simple implementation example
abstract class AbstractRepository {}
