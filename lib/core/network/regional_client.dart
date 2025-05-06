import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class RegionalClient {
  final Dio dio;

  RegionalClient(this.dio) {
    dio.options.baseUrl = 'https://api.goapi.io';
    dio.options.headers = {'X-API-KEY': dotenv.env['GOAPI_API_KEY'] ?? ''};
    dio.options.connectTimeout = const Duration(seconds: 10);
    dio.options.receiveTimeout = const Duration(seconds: 10);
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio.get(path, queryParameters: queryParameters);
  }
}
