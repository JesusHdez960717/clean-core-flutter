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

class ParentConverter extends GeneralConverter<ParentDomain, ParentEntity> {
  static final ParentConverter converter = ParentConverter._();

  ParentConverter._();

  @override
  ParentDomain toDomain(ParentEntity entity) {
    return ParentDomain(
        name: entity.name, bornDay: entity.bornDay, id: entity.id);
  }

  @override
  ParentEntity toEntity(ParentDomain domain) {
    return ParentEntity(domain.name, domain.bornDay, id: domain.id);
  }
}
