import 'package:clean_core/flutter/app/repo/entity/Converter.dart';
import 'package:clean_core/flutter/domain/CleanCoreDomainExporter.dart';

import 'EntityObject.dart';

abstract class BasicEntityObject<Domain extends BasicDomainObject>
    extends EntityObject with IntIdentifier, Converter<Domain> {}
