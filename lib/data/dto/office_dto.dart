class OfficeDto {
  final int id;
  final String name;
  final String logo;
  final String location;
  final String type;
  final bool stripePayment;
  final double rate;
  final int ratingCount;

  OfficeDto({
    required this.id,
    required this.name,
    required this.logo,
    required this.location,
    required this.type,
    required this.rate,
    required this.ratingCount,
    required this.stripePayment,
  });

  factory OfficeDto.fromJson(Map<String, dynamic> json) => OfficeDto(
    id: json['id'] ?? json['officeId'] ?? 0,
    name: json['name'] ?? '',
    logo: json['logo'] ?? '',
    location: json['location'] ?? '',
    type: json['type'] ?? '',
    stripePayment: json['stripe_payment'] ?? false,
    rate: double.tryParse(json['rate']?.toString() ?? '') ?? 0.0,
    ratingCount: json['rating_count'] ?? 0,
  );

  factory OfficeDto.empty() {
    return OfficeDto(
      id: 0,
      name: "العنوان",
      logo: "logo",
      location: "الموقع",
      type: "النوع",
      rate: 0,
      ratingCount: 0,
      stripePayment: false,
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

  static List<OfficeDto> fromJsonArray(List<dynamic> jsonArray) {
    return jsonArray.map((e) => OfficeDto.fromJson(e)).toList();
  }
}
