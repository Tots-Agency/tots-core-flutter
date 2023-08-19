import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tots_core/src/https/tots_http_exception.dart';

typedef ParseHttpCallback = dynamic Function(dynamic);

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
    return request<T>('POST', path, data, callback);
  }

  static Future<T> put<T>(String path, Map<String, dynamic> data, ParseHttpCallback callback) async {
    return request<T>('PUT', path, data, callback);
  }

  static Future<T> getWithQuery<T>(String path, Map<String, dynamic>? queryParameters, ParseHttpCallback callback) async {
    return request<T>('GET', path, queryParameters, callback);
  }

  static Future<T> get<T>(String path, ParseHttpCallback callback) async {
    return request<T>('GET', path, null, callback);
  }

  static Future<T> delete<T>(String path, ParseHttpCallback callback) async {
    return request<T>('DELETE', path, null, callback);
  }

  static Future<T> request<T>(String method, String path, Map<String, dynamic>? data, ParseHttpCallback callback) async {
    try {
      dynamic response;
      if(method == 'POST'){
        response = await TotsHttp.instance.post(path, data: data);
      } else if(method == 'GET'){
        response = await TotsHttp.instance.get(path, queryParameters: data);
      } else if(method == 'PUT'){
        response = await TotsHttp.instance.put(path, data: data);
      } else if(method == 'DELETE'){
        response = await TotsHttp.instance.delete(path);
      } else {
        throw Exception('Method not allowed');
      }
      if(response.statusCode == 200){
        return callback(response.data);
      }
      throw Exception('Error undefined');
    } on DioException catch (e) {
      throw TotsHttpException.fromDioException(e);
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
}