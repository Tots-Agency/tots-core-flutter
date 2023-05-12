import 'package:dio/dio.dart';
import 'package:tots_core/src/entities/tots_base_entity.dart';
import 'package:tots_core/src/https/tots_http.dart';

class TotsBaseHttpService<T extends TotsBaseEntity> {

  String basePath = '';

  TotsBaseHttpService(this.basePath);

  Future<T> create(T item) async {
    try {
      final response = await TotsHttp.instance.post<T>(basePath, data: item.toJson());

      if (response.statusCode != 200) {
        throw Exception('Error create 1');
      }

      return response.data!;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<T> fetchById(int id) async {
    try {
      final response = await TotsHttp.instance.get<T>('$basePath/$id');

      if (response.statusCode != 200) {
        throw Exception('Error fetchById 1');
      }

      return response.data!;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<dynamic> delete(int id) async {
    try {
      final response = await TotsHttp.instance.delete<dynamic>('$basePath/$id');

      if (response.statusCode != 200) {
        throw Exception('Error delete 1');
      }

      return response.data!;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<T> update(T item) async {
    try {
      final response = await TotsHttp.instance.put<T>('$basePath/${item.id}', data: item.toJson());

      if (response.statusCode != 200) {
        throw Exception('Error update 1');
      }

      return response.data!;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}