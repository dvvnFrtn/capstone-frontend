class SubdistrictResponse {
  final String status;
  final String message;
  final List<Subdistrict> data;

  SubdistrictResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SubdistrictResponse.fromJson(Map<String, dynamic> json) {
    return SubdistrictResponse(
      status: json['status'],
      message: json['message'],
      data: List<Subdistrict>.from(
        (json['data'] as List).map((item) => Subdistrict.fromJson(item)),
      ),
    );
  }
}

class Subdistrict {
  final String id;
  final String name;

  Subdistrict({required this.id, required this.name});

  factory Subdistrict.fromJson(Map<String, dynamic> json) {
    return Subdistrict(id: json['id'], name: json['name']);
  }
}
