import 'package:capstone_frontend/bloc/signup/signup_event.dart';
import 'package:capstone_frontend/bloc/signup/signup_state.dart';
import 'package:capstone_frontend/usecase/signup_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignupUsecase usecase;

  SignupBloc(this.usecase) : super(SignupInitial()) {
    on<SignupRequested>((event, emit) async {
      try {
        final result = await usecase.signup(event.request);
        if (result['success']) {
          emit(SignupSuccess(result['message'], result['email']));
        } else {
          emit(SignupFailure(result['message']));
        }
      } catch (e) {
        emit(SignupFailure(e.toString()));
      }
    });
  }
}
