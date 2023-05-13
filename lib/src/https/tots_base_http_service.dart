import 'package:dio/dio.dart';
import 'package:tots_core/src/entities/tots_base_entity.dart';
import 'package:tots_core/src/https/tots_http.dart';
import 'package:tots_core/tots_core.dart';

class TotsBaseHttpService<T extends TotsBaseEntity> {

  String basePath = '';

  TotsBaseHttpService(this.basePath);

  Future<Map<String, dynamic>> createBase(T item) async {
    try {
      final response = await TotsHttp.instance.post(basePath, data: item.toJson());

      if (response.statusCode != 200) {
        throw Exception('Error create 1');
      }

      return response.data!;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<Map<String, dynamic>> fetchByIdBase(int id) async {
    try {
      final response = await TotsHttp.instance.get('$basePath/$id');

      if (response.statusCode != 200) {
        throw Exception('Error fetchById 1');
      }

      return response.data!;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<Map<String, dynamic>> delete(int id) async {
    try {
      final response = await TotsHttp.instance.delete('$basePath/$id');

      if (response.statusCode != 200) {
        throw Exception('Error delete 1');
      }

      return response.data!;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<Map<String, dynamic>> updateBase(T item) async {
    try {
      final response = await TotsHttp.instance.put('$basePath/${item.id}', data: item.toJson());

      if (response.statusCode != 200) {
        throw Exception('Error update 1');
      }

      return response.data!;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<Map<String, dynamic>> listBase(TotsQuery query) async {
    try {
      final response = await TotsHttp.instance.get(basePath, queryParameters: query.toJson());

      if (response.statusCode != 200) {
        throw Exception('Error list 1');
      }

      return response.data!;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}