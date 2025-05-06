import 'package:dio/dio.dart';

class RegionalClient {
  final Dio dio;

  RegionalClient(this.dio) {
    dio.options.baseUrl = 'https://api.goapi.io';
    dio.options.headers = {'X-API-KEY': '5ef10595-42ee-547f-2802-790a9e61'};
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
