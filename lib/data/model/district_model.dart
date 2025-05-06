class DistrictResponse {
  final String status;
  final String message;
  final List<District> data;

  DistrictResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory DistrictResponse.fromJson(Map<String, dynamic> json) {
    return DistrictResponse(
      status: json['status'],
      message: json['message'],
      data: List<District>.from(
        (json['data'] as List).map((item) => District.fromJson(item)),
      ),
    );
  }
}

class District {
  final String id;
  final String name;

  District({required this.id, required this.name});

  factory District.fromJson(Map<String, dynamic> json) {
    return District(id: json['id'], name: json['name']);
  }
}
