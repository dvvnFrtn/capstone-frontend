import 'package:capstone_frontend/core/network/regional_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Dio dio;
  late RegionalClient client;

  setUp(() {
    dio = Dio();
    client = RegionalClient(dio);
  });

  test('should get data from /regional/provinsi', () async {
    final response = await client.get('/regional/provinsi');

    expect(response.statusCode, 200);
    expect(response.data, isNotNull);
    expect(response.data['data'], isList);
  });
}
