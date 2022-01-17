import 'package:clean_core/clean_core.dart';

class ParentEntity extends BasicEntityObject {
  int id;

  String name;

  DateTime bornDay;

  ParentEntity(this.name, this.bornDay,
      {this.id = 0}); //default construct, DON'T REMOVE

  //this is the one to use
  ParentEntity.build({required this.name, this.id = 0, DateTime? date})
      : bornDay = date ?? DateTime.now();
}
