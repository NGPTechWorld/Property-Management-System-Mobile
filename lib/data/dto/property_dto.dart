class PropertyDto {
  final int propertyId;
  final String postTitle;
  final String postImage;
  final String location;
  final String postDate;
  final bool isFavorite;
  final String listingType;
  final int price;
  final double rate;

  PropertyDto({
    required this.propertyId,
    required this.postTitle,
    required this.postImage,
    required this.location,
    required this.postDate,
    required this.isFavorite,
    required this.listingType,
    required this.price,
    required this.rate,
  });

  factory PropertyDto.fromJson(Map<String, dynamic> json) => PropertyDto(
    propertyId: json['propertyId'] ?? 0,
    postTitle: json['postTitle'] ?? '',
    postImage: json['postImage'] ?? '',
    location: json['location'] ?? '',
    postDate: json['postDate'] ?? '',
    isFavorite: (json['is_favorite'] ?? 0) == 1,
    listingType: json['listing_type'] ?? '',
    price: json['price'] ?? 0,
    rate: (json['rate'] ?? 0).toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'propertyId': propertyId,
    'postTitle': postTitle,
    'postImage': postImage,
    'location': location,
    'postDate': postDate,
    'is_favorite': isFavorite ? 1 : 0,
    'listing_type': listingType,
    'price': price,
    'rate': rate,
  };

  factory PropertyDto.empty() => PropertyDto(
    propertyId: 0,
    postTitle: 'عنوان العقار',
    postImage: '',
    location: 'الموقع',
    postDate: '',
    isFavorite: false,
    listingType: 'أجار',
    price: 0,
    rate: 0.0,
  );

  static List<PropertyDto> fromJsonArray(List<dynamic> jsonArray) {
    return jsonArray.map((e) => PropertyDto.fromJson(e)).toList();
  }
}
