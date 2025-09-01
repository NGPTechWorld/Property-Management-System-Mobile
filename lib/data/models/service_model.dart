class ServiceModel {
  final int id;
  final String name;
  final String logo;
  final String details;
  final String career;
  final String location;
  final String userPhone;
  final String openingTime;
  final String closingTime;
  final bool active;
  final double avgRate;
  final int ratingCount;

  ServiceModel({
    required this.id,
    required this.name,
    required this.logo,
    required this.details,
    required this.career,
    required this.location,
    required this.userPhone,
    required this.openingTime,
    required this.closingTime,
    required this.active,
    required this.avgRate,
    required this.ratingCount,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      logo: json['logo'] ?? '',
      details: json['details'] ?? '',
      career: json['career'] ?? '',
      location: json['city_name'] + ", " + json['region_name'] ?? '',
      userPhone: json['phone'] ?? '',
      openingTime: json['opening_time'] ?? '',
      closingTime: json['closing_time'] ?? '',
      active: (json['active'] ?? 0) == 1,
      avgRate: (json['avgRate'] ?? 0).toDouble(),
      ratingCount: json['ratingCount'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'logo': logo,
    'details': details,
    'career': career,
    'location': location,
    'userPhone': userPhone,
    'openingTime': openingTime,
    'closingTime': closingTime,
    'active': active ? 1 : 0,
    'avgRate': avgRate,
    'ratingCount': ratingCount,
  };

  factory ServiceModel.empty() => ServiceModel(
    id: 0,
    name: 'مزود خدمة',
    logo: '',
    details: 'تفاصيل الخدمة',
    career: 'المهنة',
    location: 'الموقع',
    userPhone: '',
    openingTime: '8:00 صباحا',
    closingTime: '4:00 مساءا',
    active: false,
    avgRate: 0,
    ratingCount: 0,
  );
}
