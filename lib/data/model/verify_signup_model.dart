class VerifySignupRequestModel {
  final String email;
  final String token;

  VerifySignupRequestModel({required this.email, required this.token});

  Map<String, dynamic> toJson() => {'email': email, 'token': token};
}
