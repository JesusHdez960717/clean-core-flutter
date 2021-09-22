import 'package:clean_core/flutter/app/repo/entity/AbstractCleanEntity.dart';
import 'package:clean_core/flutter/app/repo/entity/Converter.dart';
import 'package:clean_core/flutter/domain/AbstractCleanDomain.dart';
import 'package:clean_core/flutter/domain/IntIdentifier.dart';

abstract class BasicCleanEntity<Domain extends AbstractCleanDomain> extends AbstractCleanEntity
    with IntIdentifier, Converter<Domain> {}
