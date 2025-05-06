import 'package:capstone_frontend/bloc/verify_signup/verify_signup_bloc.dart';
import 'package:capstone_frontend/data/model/verify_signup_model.dart';
import 'package:capstone_frontend/presentation/screens/otp_screen.dart';
import 'package:capstone_frontend/usecase/signup_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: OtpScreen)
Widget defaultOtpScreenUseCase(BuildContext context) {
  final usecase = createMockVerifySignupUsecase();
  return BlocProvider(
    create: (_) => VerifySignupBloc(usecase),
    child: OtpScreen(email: 'example@gmail.com'),
  );
}

class MockVerifySignupUsecase extends Mock implements SignupUsecase {}

class FakeVerifySignupRequestModel extends Fake
    implements VerifySignupRequestModel {}

MockVerifySignupUsecase createMockVerifySignupUsecase() {
  final usecase = MockVerifySignupUsecase();

  registerFallbackValue(FakeVerifySignupRequestModel());

  when(() => usecase.verify(any())).thenAnswer(
    (_) async => {
      'success': true,
      'access_token': 'test-access-token',
      'refresh_token': 'test-refresh-token',
    },
  );

  return usecase;
}
