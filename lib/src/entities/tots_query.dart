import 'dart:convert';

class TotsQuery {
  int page = 1;
  int perPage = 50;
  List<Map<String, dynamic>> wheres = List.empty(growable: true);
  List<Map<String, dynamic>> orders = List.empty(growable: true);
  List<String> withs = List.empty(growable: true);

  void addWhereEqual(String key, String value) {
    wheres.add({
      'type': 'equal',
      'key': key,
      'value': value,
    });
  }

  void addWhereBetween(String key, String from, String to) {
    wheres.add({
      'type': 'between',
      'key': key,
      'from': from,
      'to': to,
    });
  }

  void addWhereDate(String key, String value) {
    wheres.add({
      'type': 'date',
      'key': key,
      'value': value,
    });
  }

  void addWhereGreaterThan(String key, dynamic value) {
    wheres.add({
      'type': 'greater-than',
      'key': key,
      'value': value,
    });
  }

  void addWhereLessThan(String key, dynamic value) {
    wheres.add({
      'type': 'less-than',
      'key': key,
      'value': value,
    });
  }

  void addWhereIn(String key, List<dynamic> value) {
    wheres.add({
      'type': 'in',
      'key': key,
      'value': value,
    });
  }

  void addWhereYear(String key, dynamic value) {
    wheres.add({
      'type': 'year',
      'key': key,
      'value': value,
    });
  }

  void addWhereLikes(List<String> keys, dynamic value) {
    wheres.add({
      'type': 'likes',
      'keys': keys,
      'value': value,
    });
  }

  void resetWheres() {
    wheres = [];
  }

  void cleanWheres() {
    wheres = [];
  }

  void addWith(String key) {
    withs.add(key);
  }

  void addOrderAsc(String field) {
    orders.add({
      'type': 'asc',
      'field': field
    });
  }

  void addOrderDesc(String field) {
    orders.add({
      'type': 'desc',
      'field': field
    });
  }

  String convertWheresToBase64() {
    return base64Encode(utf8.encode(jsonEncode({ wheres: wheres, orders: orders })));
  }

  @override
  String toString() {
    return 'page=$page&per_page=$perPage&withs=${withs.join(',')}&filters=${convertWheresToBase64()}&perPage=$perPage';
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'per_page': perPage,
      'withs': withs.join(','),
      'filters': convertWheresToBase64(),
      'perPage': perPage,
    };
  }
}