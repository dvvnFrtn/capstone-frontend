class CityResponse {
  final String status;
  final String message;
  final List<City> data;

  CityResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CityResponse.fromJson(Map<String, dynamic> json) {
    return CityResponse(
      status: json['status'],
      message: json['message'],
      data: List<City>.from(
        (json['data'] as List).map((item) => City.fromJson(item)),
      ),
    );
  }
}

class City {
  final String id;
  final String name;

  City({required this.id, required this.name});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(id: json['id'], name: json['name']);
  }
}
