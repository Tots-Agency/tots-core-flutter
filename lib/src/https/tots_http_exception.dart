import 'package:dio/dio.dart';

class TotsHttpException implements Exception {
  final String? message;
  final int statusCode;

  TotsHttpException(this.message, this.statusCode);

  @override
  String toString() {
    return 'TotsHttpException{message: $message, statusCode: $statusCode}';
  }

  static TotsHttpException fromDioException(DioException e) {
    if(e.response == null || e.response?.data == null){
      return TotsHttpException(e.message, -1);
    }

    if(e.response?.data is String){
      return TotsHttpException('Internal server error', -2);
    }

    Map<String, dynamic> json = e.response?.data as Map<String, dynamic>;
    if(json['error'] != null && json['error']['message'] != null){
      return TotsHttpException(json['error']['message'], json['error']['code']);
    }

    return TotsHttpException(e.message, -1);
  }
}