class ProvinceResponse {
  final String status;
  final String message;
  final List<Province> data;

  ProvinceResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ProvinceResponse.fromJson(Map<String, dynamic> json) {
    return ProvinceResponse(
      status: json['status'],
      message: json['message'],
      data: List<Province>.from(
        (json['data'] as List).map((item) => Province.fromJson(item)),
      ),
    );
  }
}

class Province {
  final String id;
  final String name;

  Province({required this.id, required this.name});

  factory Province.fromJson(Map<String, dynamic> json) {
    return Province(id: json['id'], name: json['name']);
  }
}
