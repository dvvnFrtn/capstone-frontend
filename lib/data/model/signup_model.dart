class SignupRequestModel {
  final String email;
  final String password;
  final String fullname;
  final int rtNumber;
  final int rwNumber;
  final String subdistrict;
  final String district;
  final String city;
  final String province;

  SignupRequestModel({
    required this.email,
    required this.password,
    required this.fullname,
    required this.rtNumber,
    required this.rwNumber,
    required this.subdistrict,
    required this.district,
    required this.city,
    required this.province,
  });

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
    'fullname': fullname,
    'rt_number': rtNumber,
    'rw_number': rwNumber,
    'subdistrict': subdistrict,
    'district': district,
    'city': city,
    'province': province,
  };
}
