class TourismDto {
  final int propertyId;
  final String postImage;
  final String postTitle;
  final String description;
  final String date;
  final List<String> images;
  final double area;
  final String location;
  final double price;
  final String listingType;
  final String type;
  final double rate;
  final double avgRate;
  final bool isFavorite;

  TourismDto({
    required this.propertyId,
    required this.postImage,
    required this.postTitle,
    required this.description,
    required this.date,
    required this.images,

    required this.area,
    required this.location,
    required this.price,
    required this.listingType,
    required this.type,
    required this.rate,
    required this.isFavorite,
    required this.avgRate,
  });

  factory TourismDto.fromJson(Map<String, dynamic> json) => TourismDto(
    propertyId: json['propertyId'] ?? 0,
    postImage: json['postImage'] ?? '',
    postTitle: json['postTitle'] ?? '',
    description: json['description'] ?? '',
    date: json['date'] ?? '',
    images: List<String>.from(json['images'] ?? []),
    area: (json['area'] ?? 0).toDouble(),
    location: json['location'] ?? '',
    price: (json['price'] ?? 0).toDouble(),
    listingType: json['listingType'] ?? '',
    type: json['type'] ?? '',
    avgRate: (json['avg_rate'] ?? 0).toDouble(),
    rate:
        (json['rate'] != null)
            ? double.tryParse(json['rate'].toString()) ?? 0.0
            : 0.0,
    isFavorite: (json['is_favorite'] ?? 0) == 1,
  );

  Map<String, dynamic> toJson() => {
    'propertyId': propertyId,
    'postImage': postImage,
    'postTitle': postTitle,
    'description': description,
    'date': date,
    'images': images,
    'area': area,
    'location': location,
    'price': price,
    'listingType': listingType,
    'type': type,
    'rate': rate,
    'avg_rate': avgRate,
    'is_favorite': isFavorite ? 1 : 0,
  };

  factory TourismDto.empty() => TourismDto(
    propertyId: 0,
    postImage: '',
    postTitle: 'عنوان سياحي',
    description: '',
    date: '',
    images: [],
    area: 0.0,
    location: 'الموقع',
    price: 0.0,
    listingType: 'أجار',
    type: 'سياحي',
    rate: 0.0,
    avgRate: 0.0,
    isFavorite: true,
  );

  static List<TourismDto> fromJsonArray(List<dynamic> jsonArray) {
    return jsonArray.map((e) => TourismDto.fromJson(e)).toList();
  }
}
