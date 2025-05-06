import 'package:capstone_frontend/data/datasource/signup_backend_datasource.dart';
import 'package:capstone_frontend/data/model/signup_model.dart';

class SignupUsecase {
  final SignupDatasource source;

  SignupUsecase(this.source);

  Future<Map<String, dynamic>> signup(SignupRequestModel request) async {
    return await source.signup(request);
  }
}
