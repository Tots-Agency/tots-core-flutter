import 'dart:convert';

abstract class TotsBaseEntity {
  int? id;

  TotsBaseEntity.fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();

  String toJsonString() {
    return jsonEncode(toJson());
  }
}