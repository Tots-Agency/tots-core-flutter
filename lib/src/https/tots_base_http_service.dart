import 'package:tots_core/src/entities/tots_base_entity.dart';
import 'package:tots_core/src/https/tots_http.dart';
import 'package:tots_core/src/entities/tots_query.dart';

class TotsBaseHttpService<T extends TotsBaseEntity> {

  String basePath = '';

  TotsBaseHttpService(this.basePath);

  Future<Map<String, dynamic>> createBase(T item) async {
    return TotsHttp.post(basePath, item.toJson(), (data) => data);
  }

  Future<Map<String, dynamic>> fetchByIdBase(int id) async {
    return TotsHttp.get('$basePath/$id', (data) => data);
  }

  Future<Map<String, dynamic>> delete(int id) async {
    return TotsHttp.delete('$basePath/$id', (data) => data);
  }

  Future<Map<String, dynamic>> updateBase(T item) async {
    return TotsHttp.post('$basePath/${item.id}', item.toJson(), (data) => data);
  }

  Future<Map<String, dynamic>> listBase(TotsQuery query) async {
    return TotsHttp.getWithQuery(basePath, query.toJson(), (data) => data);
  }
}