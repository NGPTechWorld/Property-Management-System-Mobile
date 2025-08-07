class TourismDto {
  final int tourismId;
  final String postImage;
  final String postTitle;
  final double area;
  final String location;
  final double price;
  final String listingType;
  final String type;
  final double rate;

  TourismDto({
    required this.tourismId,
    required this.postImage,
    required this.postTitle,
    required this.area,
    required this.location,
    required this.price,
    required this.listingType,
    required this.type,
    required this.rate,
  });

  factory TourismDto.fromJson(Map<String, dynamic> json) => TourismDto(
    tourismId: json['propertyId'] ?? 0,
    postImage: json['postImage'] ?? '',
    postTitle: json['postTitle'] ?? '',
    area: (json['area'] ?? 0).toDouble(),
    location: json['location'] ?? '',
    price: (json['price'] ?? 0).toDouble(),
    listingType: json['listingType'] ?? '',
    type: json['type'] ?? '',
    rate: (json['rate'] ?? 0).toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'propertyId': tourismId,
    'postImage': postImage,
    'postTitle': postTitle,
    'area': area,
    'location': location,
    'price': price,
    'listingType': listingType,
    'type': type,
    'rate': rate,
  };

  factory TourismDto.empty() => TourismDto(
    tourismId: 0,
    postImage: '',
    postTitle: 'عنوان سياحي',
    area: 0.0,
    location: 'الموقع',
    price: 0.0,
    listingType: 'أجار',
    type: 'سياحي',
    rate: 0.0,
  );

  static List<TourismDto> fromJsonArray(List<dynamic> jsonArray) {
    return jsonArray.map((e) => TourismDto.fromJson(e)).toList();
  }
}
