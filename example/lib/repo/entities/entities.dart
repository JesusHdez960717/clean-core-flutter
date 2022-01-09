import 'package:clean_core/clean_core.dart';
import 'package:clean_core_example/clean_core_example.dart';

class ParentEntity extends BasicEntityObject<ParentDomain> {
  int id;

  String name;

  DateTime bornDay;

  ///todo: docs => no se puede estandarizar, es una buena práctica
  ParentEntity.fromDomain(ParentDomain domain)
      : id = domain.id,
        name = domain.name,
        bornDay = domain.bornDay;

  ParentEntity(this.name, this.bornDay,
      {this.id = 0}); //default construct, DON'T REMOVE

  //this is the one to use
  ParentEntity.build({required this.name, this.id = 0, DateTime? date})
      : bornDay = date ?? DateTime.now();

  @override
  ParentDomain toDomain() {
    return ParentDomain(id: id, name: name, bornDay: bornDay);
  }
}
