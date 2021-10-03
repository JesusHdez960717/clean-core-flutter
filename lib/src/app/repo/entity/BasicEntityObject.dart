import 'package:clean_core/clean_core.dart';

import 'EntityObject.dart';

///Most simple of all possible entity object's
///
abstract class BasicEntityObject<Domain extends BasicDomainObject>
    extends EntityObject with IntIdentifier, Converter<Domain> {}
