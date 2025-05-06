import 'package:capstone_frontend/data/model/verify_signup_model.dart';
import 'package:equatable/equatable.dart';

abstract class VerifySignupEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class VerifySignupRequested extends VerifySignupEvent {
  final VerifySignupRequestModel request;

  VerifySignupRequested(this.request);
}
