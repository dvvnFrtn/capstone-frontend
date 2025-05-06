import 'package:capstone_frontend/bloc/regional/regional_bloc.dart';
import 'package:capstone_frontend/bloc/signup/signup_bloc.dart';
import 'package:capstone_frontend/bloc/verify_signup/verify_signup_bloc.dart';
import 'package:capstone_frontend/core/network/backend_client.dart';
import 'package:capstone_frontend/core/network/regional_client.dart';
import 'package:capstone_frontend/data/datasource/regional_datasource.dart';
import 'package:capstone_frontend/data/datasource/signup_backend_datasource.dart';
import 'package:capstone_frontend/data/datasource/token_datasource.dart';
import 'package:capstone_frontend/usecase/regional_usecase.dart';
import 'package:capstone_frontend/usecase/signup_usecase.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Clients
  sl.registerLazySingleton(() => RegionalClient(Dio()));
  sl.registerLazySingleton(() => BackendClient(Dio()));

  // Datasources
  sl.registerLazySingleton<RegionalDatasource>(
    () => GoapiRegionalDatasource(sl()),
  );
  sl.registerLazySingleton<SignupDatasource>(
    () => SignupBackendDatasource(sl()),
  );
  sl.registerLazySingleton<TokenDatasource>(
    () => SecureTokenDatasource(FlutterSecureStorage()),
  );

  // Usecases
  sl.registerLazySingleton(() => RegionalUsecase(sl()));
  sl.registerLazySingleton(
    () => SignupUsecase(sl<SignupDatasource>(), sl<TokenDatasource>()),
  );

  // BloCs
  sl.registerFactory(() => RegionalBloc(sl()));
  sl.registerFactory(() => SignupBloc(sl()));
  sl.registerFactory(() => VerifySignupBloc(sl()));
}
