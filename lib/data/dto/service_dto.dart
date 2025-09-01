class ServiceDto {
  final int id;
  final String name;
  final String logo;
  final String location;
  final String career;
  final String userPhone;
  final double rate;
  final int ratingCount;

  ServiceDto({
    required this.id,
    required this.name,
    required this.logo,
    required this.location,
    required this.career,
    required this.userPhone,
    required this.rate,
    required this.ratingCount,
  });

  factory ServiceDto.fromJson(Map<String, dynamic> json) => ServiceDto(
    id: json['id'] ?? 0,
    name: json['name'] ?? '',
    logo: json['logo'] ?? '',
    location: json['location'] ?? '',
    career: json['career'] ?? '',
    userPhone: json['userPhone'] ?? '',
    rate: (json['avgRate'] ?? json['rate'] ?? 0).toDouble(),
    ratingCount: json['rating_count'] ?? 0,
  );

  factory ServiceDto.empty() {
    return ServiceDto(
      id: 0,
      name: "العنوان",
      logo: "logo",
      location: "الموقع",
      career: "النوع",
      userPhone: "09xxxxxxxx",
      rate: 0,
      ratingCount: 0,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'logo': logo,
    'location': location,
    'rate': rate,
    'rating_count': ratingCount,
  };

  static List<ServiceDto> fromJsonArray(List<dynamic> jsonArray) {
    return jsonArray.map((e) => ServiceDto.fromJson(e)).toList();
  }
}
