import 'package:capstone_frontend/bloc/verify_signup/verify_signup_event.dart';
import 'package:capstone_frontend/bloc/verify_signup/verify_signup_state.dart';
import 'package:capstone_frontend/usecase/signup_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifySignupBloc extends Bloc<VerifySignupEvent, VerifySignupState> {
  final SignupUsecase usecase;

  VerifySignupBloc(this.usecase) : super(VerifySignupInitial()) {
    on<VerifySignupRequested>((event, emit) async {
      emit(VerifySignupLoading());
      try {
        final result = await usecase.verify(event.request);
        if (result['success']) {
          emit(
            VerifySignupSuccess(
              result['access_token'],
              result['refresh_token'],
            ),
          );
        } else {
          emit(VerifySignupFailure(result['message']));
        }
      } catch (e) {
        emit(VerifySignupFailure(e.toString()));
      }
    });
  }
}
