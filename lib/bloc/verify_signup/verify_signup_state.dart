import 'package:equatable/equatable.dart';

abstract class VerifySignupState extends Equatable {
  @override
  List<Object?> get props => [];
}

class VerifySignupInitial extends VerifySignupState {}

class VerifySignupLoading extends VerifySignupState {}

class VerifySignupSuccess extends VerifySignupState {
  final String accessToken;
  final String refreshToken;

  VerifySignupSuccess(this.accessToken, this.refreshToken);
}

class VerifySignupFailure extends VerifySignupState {
  final String error;

  VerifySignupFailure(this.error);
}
