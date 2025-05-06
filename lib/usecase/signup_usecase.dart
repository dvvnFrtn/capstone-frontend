import 'package:capstone_frontend/data/datasource/signup_backend_datasource.dart';
import 'package:capstone_frontend/data/datasource/token_datasource.dart';
import 'package:capstone_frontend/data/model/signup_model.dart';
import 'package:capstone_frontend/data/model/verify_signup_model.dart';

class SignupUsecase {
  final SignupDatasource source;
  final TokenDatasource tokenSource;

  SignupUsecase(this.source, this.tokenSource);

  Future<Map<String, dynamic>> signup(SignupRequestModel request) async {
    return await source.signup(request);
  }

  Future<Map<String, dynamic>> verify(VerifySignupRequestModel request) async {
    final result = await source.verify(request);
    if (result['success']) {
      await tokenSource.saveTokens(
        result['access_token'],
        result['refresh_token'],
      );
    }
    return result;
  }
}
