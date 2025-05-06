import 'package:capstone_frontend/data/model/signup_model.dart';
import 'package:equatable/equatable.dart';

abstract class SignupEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignupRequested extends SignupEvent {
  final SignupRequestModel request;

  SignupRequested(this.request);
}
