import 'package:capstone_frontend/core/network/backend_client.dart';
import 'package:capstone_frontend/data/model/signup_model.dart';
import 'package:capstone_frontend/data/model/verify_signup_model.dart';
import 'package:dio/dio.dart';

abstract class SignupDatasource {
  Future<Map<String, dynamic>> signup(SignupRequestModel request);
  Future<Map<String, dynamic>> verify(VerifySignupRequestModel request);
}

class SignupBackendDatasource implements SignupDatasource {
  final BackendClient client;

  SignupBackendDatasource(this.client);

  @override
  Future<Map<String, dynamic>> signup(SignupRequestModel request) async {
    try {
      final response = await client.post('/auth/signup', request.toJson());
      return {
        'success': true,
        'message': response.data['message'],
        'email': response.data['data']['email'],
      };
    } on DioException catch (e) {
      if (e.response != null) {
        final status = e.response?.statusCode;
        final data = e.response?.data;
        final message = data['message'] ?? 'Terjadi kesalahan';
        return {'success': false, 'status': status, 'message': message};
      } else {
        return {'success': false, 'message': 'Tidak dapat terhubung ke server'};
      }
    }
  }

  @override
  Future<Map<String, dynamic>> verify(VerifySignupRequestModel request) async {
    try {
      final response = await client.post(
        '/auth/signup/verify',
        request.toJson(),
      );
      return {
        'success': true,
        'message': response.data['message'],
        'access_token': response.data['data']['access_token'],
        'refresh_token': response.data['data']['refresh_token'],
      };
    } on DioException catch (e) {
      if (e.response != null) {
        final status = e.response?.statusCode;
        final data = e.response?.data;
        final message = data['message'] ?? 'Terjadi kesalahan';
        return {'success': false, 'status': status, 'message': message};
      } else {
        return {'success': false, 'message': 'Tidak dapat terhubung ke server'};
      }
    }
  }
}
