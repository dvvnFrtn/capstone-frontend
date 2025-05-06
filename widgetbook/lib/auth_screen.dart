import 'package:capstone_frontend/bloc/regional/regional_bloc.dart';
import 'package:capstone_frontend/bloc/signup/signup_bloc.dart';
import 'package:capstone_frontend/data/model/city_model.dart';
import 'package:capstone_frontend/data/model/district_model.dart';
import 'package:capstone_frontend/data/model/province_model.dart';
import 'package:capstone_frontend/data/model/signup_model.dart';
import 'package:capstone_frontend/data/model/subdistrict_model.dart';
import 'package:capstone_frontend/presentation/screens/auth_screen.dart';
import 'package:capstone_frontend/usecase/regional_usecase.dart';
import 'package:capstone_frontend/usecase/signup_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: SignupScreen)
Widget defaultAythScreenUseCase(BuildContext context) {
  final usecaseRegional = createMockRegionalUseCase();
  final usecaseSignup = createMockSignupUseCase();

  return MultiBlocProvider(
    providers: [
      BlocProvider<SignupBloc>(create: (_) => SignupBloc(usecaseSignup)),
      BlocProvider<RegionalBloc>(create: (_) => RegionalBloc(usecaseRegional)),
    ],
    child: SignupScreen(),
  );
}

class MockRegionalUseCase extends Mock implements RegionalUsecase {}

MockRegionalUseCase createMockRegionalUseCase() {
  final usecase = MockRegionalUseCase();

  when(() => usecase.province()).thenAnswer(
    (_) async => [
      Province(id: '1', name: 'Jawa Timur'),
      Province(id: '2', name: 'Jawa Tengah'),
      Province(id: '3', name: 'Jawa Barat'),
      Province(id: '4', name: 'Yogyakarta'),
      Province(id: '5', name: 'Bangka Belitung'),
    ],
  );
  when(() => usecase.city(any())).thenAnswer(
    (_) async => [
      City(id: '1.1', name: 'Blitar'),
      City(id: '1.2', name: 'Tulungagung'),
      City(id: '1.3', name: 'Malang'),
    ],
  );
  when(() => usecase.district(any())).thenAnswer(
    (_) async => [
      District(id: '1.1', name: 'Wonodadi'),
      District(id: '1.2', name: 'Ngantru'),
      District(id: '1.3', name: 'Lowokwaru'),
    ],
  );
  when(() => usecase.subdistrict(any())).thenAnswer(
    (_) async => [
      Subdistrict(id: '1.1', name: 'Cemandi'),
      Subdistrict(id: '1.1', name: 'Gandekan'),
      Subdistrict(id: '1.1', name: 'Karanggayam'),
    ],
  );

  return usecase;
}

class MockSignupUseCase extends Mock implements SignupUsecase {}

class FakeSignupRequestModel extends Fake implements SignupRequestModel {}

MockSignupUseCase createMockSignupUseCase() {
  final usecase = MockSignupUseCase();

  registerFallbackValue(FakeSignupRequestModel());

  when(() => usecase.signup(any())).thenAnswer(
    (_) async => {
      'success': true,
      'message': 'Registrasi akun telah berhasil',
      'email': 'example@gmail.com',
    },
  );

  return usecase;
}
