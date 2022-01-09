import 'package:clean_core/clean_core.dart';
import 'package:clean_core_example/clean_core_example.dart';

class ParentRepoImpl extends DefaultCRUDRepo<ParentDomain, ParentEntity>
    implements ParentRepo {
  //late ParentRepoExternal _external;

  ParentRepoImpl()
      : super(
            externalRepo: ParentRepoExternalImpl(),
            converter: ParentConverter.converter) {
    //_external = externalRepo as ParentRepoExternal;//in case of needed
  }

  @override
  String doStuffDeeper() {
    return "Doing Stuff Super deep, can go deeper";
  }
}

class ParentConverter
    extends DefaultGeneralConverter<ParentDomain, ParentEntity> {
  static final ParentConverter converter = ParentConverter._();

  ParentConverter._();

  @override
  ParentDomain toDomain(ParentEntity entity) {
    return entity.toDomain();
  }

  @override
  ParentEntity toEntity(ParentDomain domain) {
    return ParentEntity.fromDomain(domain);
  }
}
