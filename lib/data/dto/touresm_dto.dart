class TourismDto {
  final int id;
  final String title;
  final String image;
  final String location;
  final String listingType;
  final int price;
  final String rentalPeriod;
  final bool isFavorite;
  final double avgRate;
  final int ratingCount;

  TourismDto({
    required this.id,
    required this.title,
    required this.image,
    required this.location,
    required this.listingType,
    required this.price,
    required this.rentalPeriod,
    required this.isFavorite,
    required this.avgRate,
    required this.ratingCount,
  });

  factory TourismDto.fromJson(Map<String, dynamic> json) => TourismDto(
    id: json['id'] ?? 0,
    title: json['title'] ?? '',
    image: json['image'] ?? '',
    location: json['location'] ?? '',
    listingType: json['listing_type'] ?? '',
    price: json['price'] ?? 0,
    rentalPeriod: json['rental_period'] ?? '',
    isFavorite: (json['is_favorite'] ?? 0) == 1,
    avgRate: (json['avg_rate'] ?? 0).toDouble(),
    ratingCount: json['rating_count'] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'image': image,
    'location': location,
    'listing_type': listingType,
    'price': price,
    'rental_period': rentalPeriod,
    'is_favorite': isFavorite ? 1 : 0,
    'avg_rate': avgRate,
    'rating_count': ratingCount,
  };

  static List<TourismDto> fromJsonArray(List<dynamic> jsonArray) {
    return jsonArray.map((e) => TourismDto.fromJson(e)).toList();
  }
}
