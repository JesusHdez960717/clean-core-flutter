import 'dart:convert';

import 'package:clean_core/clean_core.dart';

abstract class JSONConverter<Entity extends BasicEntityObject> {
  ///Convert JSON String into map then into entity.
  Entity fromJSONString(String json) {
    return fromJSONMap(jsonDecode(json));
  }

  ///***** TO IMPLEMENT *****///
  ///Convert JSON map into entity.
  Entity fromJSONMap(Map<String, dynamic> json);

  ///***** TO IMPLEMENT *****///
  ///Convert entity into JSON.
  Map<String, dynamic> toJSONMap(Entity entity);

  ///Convert entity into JSON theon to String
  String toJSONString(Entity entity) {
    return jsonEncode(toJSONMap(entity));
  }

  ///Convert a JSON String into a list of maps then list of entities.
  List<Entity> fromJSONAllString(String json) {
    return fromJSONAllList(jsonDecode(json));
  }

  ///Convert a JSON into a list of entities.
  List<Entity> fromJSONAllList(List<dynamic> json) {
    return List<Entity>.from(
      json.map(
        (singleEntityMap) => fromJSONMap(singleEntityMap),
      ),
    );
  }

  ///Convert a list of entities into a String JSON.
  String toEntityAllString(List<Entity> entities) {
    return jsonEncode(
      toEntityAllList(entities),
    );
  }

  ///Convert a list of entities into a List<Map>.
  List<Map<String, dynamic>> toEntityAllList(List<Entity> entities) {
    return List<Map<String, dynamic>>.from(
      entities.map(
        (e) => toJSONString(e),
      ),
    );
  }
}
