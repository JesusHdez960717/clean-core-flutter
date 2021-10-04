import 'package:clean_core/clean_core.dart';

///Abstract use case, it defines a type.
///
/// Responsibility:
/// It's in charge of the logic of the application, don't know the ui or persistence
/// framework.
/// This is the layer where data is processed, validations are checked, sorting...
///
/// See [CRUDUseCase] for simple implementation example
abstract class AbstractUseCase {}
