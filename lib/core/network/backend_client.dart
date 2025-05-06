import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class BackendClient {
  final Dio dio;

  BackendClient(this.dio) {
    dio.options.baseUrl = dotenv.env['API_BASE_URL'] ?? '';
    dio.options.connectTimeout = const Duration(seconds: 10);
    dio.options.receiveTimeout = const Duration(seconds: 10);
  }

  Future<Response> post(String path, Map<String, dynamic> data) async {
    return await dio.post(path, data: data);
  }
}
