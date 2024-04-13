import 'dart:io';
import 'package:dio/dio.dart';
import 'package:mime/mime.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tots_core/src/entities/tots_file.dart';

class TotsCloudStorageHttp {

  String generateFilename(File file) {
    DateTime now = DateTime.now();
    // Get filename with file extension
    String fileName = file.path.split('/').last;
    // Create new name in flutter
    return '${now.millisecond}_${now.year}${now.month}${now.day}${now.hour}_${fileName.replaceAll(' ', '')}';  
  }

  Future<dynamic> uploadFile(File file) async {
    try {
      String filename = generateFilename(file);

      final response = await Dio(BaseOptions(
        headers: {
          'Content-Type': lookupMimeType(file.path),
          'Accept': "*/*",
          'Content-Length': file.lengthSync().toString(),
          'Connection': 'keep-alive',
        },
      )).post(
        'https://storage.googleapis.com/upload/storage/v1/b/${dotenv.env['GOOGLE_CLOUD_STORAGE_BUCKET']}/o?uploadType=media&name=$filename',
        data: Stream.fromIterable(file.readAsBytesSync().map((e) => [e]))
      );

      if (response.statusCode != 200) {
        throw Exception('Error upload image');
      }

      return TotsFile.fromCloudStorage(response.data);
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

}