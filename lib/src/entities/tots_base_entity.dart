import 'dart:convert';

abstract class TotsBaseEntity {
  int? id;

  factory TotsBaseEntity.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }
  Map<String, dynamic> toJson();

  String toJsonString() {
    return jsonEncode(toJson());
  }
}