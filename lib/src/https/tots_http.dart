import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tots_core/src/https/tots_http_exception.dart';

typedef ParseHttpCallback = dynamic Function(Map<String, dynamic>);
typedef ParseListHttpCallback = dynamic Function(List<dynamic>);

class TotsHttp {
  static final _dio = Dio();

  static void configure() {
    // Configuraciones generales
    _dio.options.baseUrl = dotenv.env['API_BASE_URL']!;
    //_dio.options.connectTimeout = 5000; // 5 segundos
    //_dio.options.receiveTimeout = 5000; // 5 segundos

    // Interceptores
    //_dio.interceptors.add(LogInterceptor());
    // Agrega aquí cualquier otro interceptor que desees utilizar
  }

  static Dio get instance => _dio;

  static Future<T> post<T>(String path, Map<String, dynamic> data, ParseHttpCallback callback) async {
    return request<T>('POST', path, data, null, callback);
  }

  static Future<T> put<T>(String path, Map<String, dynamic> data, ParseHttpCallback callback) async {
    return request<T>('PUT', path, data, null, callback);
  }

  static Future<T> patch<T>(String path, Map<String, dynamic> data, ParseHttpCallback callback) async {
    return request<T>('PATCH', path, data, null, callback);
  }

  static Future<T> getWithQuery<T>(String path, Map<String, dynamic>? queryParameters, ParseHttpCallback callback) async {
    return request<T>('GET', path, null, queryParameters, callback);
  }

  static Future<T> get<T>(String path, ParseHttpCallback callback) async {
    return request<T>('GET', path, null, null, callback);
  }

  static Future<T> delete<T>(String path, ParseHttpCallback callback) async {
    return request<T>('DELETE', path, null, null, callback);
  }

  static Future<T> request<T>(String method, String path, Map<String, dynamic>? data, Map<String, dynamic>? queryParameters, ParseHttpCallback callback) async {
    try {
      Response<Map<String, dynamic>> response = await TotsHttp.instance.request(path, data: data, queryParameters: queryParameters, options: Options(method: method));
      if(response.statusCode == 200){
        return callback.call(response.data!);
      }
      throw Exception('Error undefined');
    } on DioException catch (e) {
      throw TotsHttpException.fromDioException(e);
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<T> postList<T>(String path, Map<String, dynamic> data, ParseListHttpCallback callback) async {
    return requestList<T>('POST', path, data, null, callback);
  }

  static Future<T> putList<T>(String path, Map<String, dynamic> data, ParseListHttpCallback callback) async {
    return requestList<T>('PUT', path, data, null, callback);
  }

  static Future<T> patchList<T>(String path, Map<String, dynamic> data, ParseListHttpCallback callback) async {
    return requestList<T>('PATCH', path, data, null, callback);
  }

  static Future<T> getWithQueryList<T>(String path, Map<String, dynamic>? queryParameters, ParseListHttpCallback callback) async {
    return requestList<T>('GET', path, null, queryParameters, callback);
  }

  static Future<T> getList<T>(String path, ParseListHttpCallback callback) async {
    return requestList<T>('GET', path, null, null, callback);
  }

  static Future<T> deleteList<T>(String path, ParseListHttpCallback callback) async {
    return requestList<T>('DELETE', path, null, null, callback);
  }

  static Future<T> requestList<T>(String method, String path, Map<String, dynamic>? data, Map<String, dynamic>? queryParameters, ParseListHttpCallback callback) async {
    try {
      Response<List<dynamic>> response = await TotsHttp.instance.request(path, data: data, queryParameters: queryParameters, options: Options(method: method));
      if(response.statusCode == 200){
        return callback.call(response.data!);
      }
      throw Exception('Error undefined');
    } on DioException catch (e) {
      throw TotsHttpException.fromDioException(e);
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
}