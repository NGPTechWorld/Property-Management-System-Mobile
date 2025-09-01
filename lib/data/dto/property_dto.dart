class PropertyDto {
  final int propertyId;
  final String postTitle;
  final String postImage;
  final String location;
  final String postDate;
  final String rentalPeriod;
  final String type;
  final bool isFavorite;
  final String listingType;
  final int price;
  final int area;
  final double rate;

  PropertyDto({
    required this.propertyId,
    required this.postTitle,
    required this.postImage,
    required this.location,
    required this.postDate,
    required this.type,
    required this.rentalPeriod,
    required this.isFavorite,
    required this.listingType,
    required this.price,
    required this.area,
    required this.rate,
  });

  factory PropertyDto.fromJson(Map<String, dynamic> json) => PropertyDto(
    propertyId:
        json['propertyId'] is int
            ? json['propertyId']
            : int.tryParse(json['propertyId'].toString()) ?? 0,
    postTitle: json['postTitle']?.toString() ?? '',
    postImage: json['postImage']?.toString() ?? '',
    rentalPeriod: json['rental_period']?.toString() ?? '',
    location: json['location']?.toString() ?? '',
    type: json['type']?.toString() ?? '',
    postDate: json['postDate']?.toString() ?? '',
    isFavorite: json['is_favorite'] == 1 || json['is_favorite'] == true,
    listingType: json['listing_type']?.toString() ?? '',
    price:
        (json['price'] is num)
            ? (json['price'] as num).toInt()
            : int.tryParse(json['price'].toString()) ?? 0,
    area:
        json['area'] is num
            ? json['area']
            : int.tryParse(json['area'].toString()) ?? 0,
    rate:
        (json['rate'] is num
                ? json['rate']
                : double.tryParse(json['rate'].toString()))
            ?.toDouble() ??
        0.0,
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
    rentalPeriod: '',
    location: 'الموقع',
    type: '',
    postDate: '',
    isFavorite: false,
    listingType: 'أجار',
    price: 0,
    area: 0,
    rate: 0.0,
  );

  static List<PropertyDto> fromJsonArray(List<dynamic> jsonArray) {
    return jsonArray.map((e) => PropertyDto.fromJson(e)).toList();
  }
}
