class OfficeModel {
  final int id;
  final String name;
  final String logo;
  final String type;
  final String location;
  final String phone;
  final String openingTime;
  final String closingTime;
  final double rate;
  final List<SocialModel> socials;

  OfficeModel({
    required this.id,
    required this.name,
    required this.logo,
    required this.type,
    required this.location,
    required this.phone,
    required this.openingTime,
    required this.closingTime,
    required this.rate,
    required this.socials,
  });

  factory OfficeModel.fromJson(Map<String, dynamic> json) {
    return OfficeModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      logo: json['logo'] ?? '',
      type: json['type'] ?? '',
      location: json['location'] ?? '',
      phone: json['phone'] ?? '',
      openingTime: json['opening_time'] ?? '',
      closingTime: json['closing_time'] ?? '',
      rate: (json['rate'] ?? 0).toDouble(),
      socials:
          (json['socials'] as List<dynamic>? ?? [])
              .map((e) => SocialModel.fromJson(e))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'logo': logo,
    'type': type,
    'location': location,
    'phone': phone,
    'opening_time': openingTime,
    'closing_time': closingTime,
    'rate': rate,
    'socials': socials.map((e) => e.toJson()).toList(),
  };

  factory OfficeModel.empty() => OfficeModel(
    id: 0,
    name: 'مكتب عقاري',
    logo: '',
    type: 'نوع المكتب',
    location: 'الموقع',
    phone: '',
    openingTime: '08:00 صباحًا',
    closingTime: '04:00 مساءً',
    rate: 0,
    socials: [],
  );
}

class SocialModel {
  final String link;
  final String platform;

  SocialModel({required this.link, required this.platform});

  factory SocialModel.fromJson(Map<String, dynamic> json) {
    return SocialModel(
      link: json['link'] ?? '',
      platform: json['platform'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {'link': link, 'platform': platform};
}
