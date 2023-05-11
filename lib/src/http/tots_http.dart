import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

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
}