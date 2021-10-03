import 'package:clean_core/flutter/app/repo/entity/converter/Converter.dart';
import 'package:clean_core/flutter/domain/CleanCoreDomainExporter.dart';

import 'EntityObject.dart';

///Most simple of all possible entity object's
///
abstract class BasicEntityObject<Domain extends BasicDomainObject>
    extends EntityObject with IntIdentifier, Converter<Domain> {}
