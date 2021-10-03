//todo: sacar todos los exporter a una carpeta mas arriba para cuando se importen no sea muy largo el import

///Exporter for all classes in flutter.app.repo.entity
library clean_core_entity_exporter;

//exporta los entities
export 'EntityObject.dart';
export 'BasicEntityObject.dart';

//exporta los converter
export 'converter/Converter.dart';
export 'converter/GeneralConverter.dart';
export 'converter/DefaultGeneralConverter.dart';
