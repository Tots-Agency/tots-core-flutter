import 'package:dio/dio.dart';

class TotsHttp {
  static final _dio = Dio();

  static void configure() {
    // Configuraciones generales
    _dio.options.baseUrl = 'https://api.example.com';
    //_dio.options.connectTimeout = 5000; // 5 segundos
    //_dio.options.receiveTimeout = 5000; // 5 segundos

    // Interceptores
    //_dio.interceptors.add(LogInterceptor());
    // Agrega aquí cualquier otro interceptor que desees utilizar
  }

  static Dio get instance => _dio;
}