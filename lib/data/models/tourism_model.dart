import 'package:property_ms/data/dto/office_dto.dart';

class TourismModel {
  final int propertyId;
  final String postImage;
  final String postTitle;
  final String description;
  final String date;
  final List<String> images;
  final String longitude;
  final String latitude;
  final int roomCount;
  final int bedroomCount;
  final int livingRoomCount;
  final int kitchenCount;
  final int bathroomCount;
  final String hasFurniture;
  final int officeId;
  final String officeName;
  final String officeLocation;
  final String electricity;
  final String water;
  final String pool;
  final List<String> additionalServices;
  final double area;
  final String location;
  final double price;
  final String listingType;
  final String type;
  final double rate;
  final double avgRate;
  final bool isFavorite;
  final OfficeDto? office;

  TourismModel({
    required this.propertyId,
    required this.postImage,
    required this.postTitle,
    required this.description,
    required this.date,
    required this.images,
    required this.longitude,
    required this.latitude,
    required this.roomCount,
    required this.bedroomCount,
    required this.livingRoomCount,
    required this.kitchenCount,
    required this.bathroomCount,
    required this.hasFurniture,
    required this.officeId,
    required this.officeName,
    required this.officeLocation,
    required this.electricity,
    required this.water,
    required this.pool,
    required this.additionalServices,
    required this.area,
    required this.location,
    required this.price,
    required this.listingType,
    required this.type,
    required this.rate,
    required this.avgRate,
    required this.isFavorite,
    required this.office,
  });

  factory TourismModel.fromJson(Map<String, dynamic> json) => TourismModel(
    propertyId: json['propertyId'] ?? 0,
    postImage: json['postImage'] ?? '',
    postTitle: json['postTitle'] ?? '',
    description: json['description'] ?? '',
    date: json['date'] ?? '',
    images: List<String>.from(json['images'] ?? []),
    longitude: json['longitude'] ?? '',
    latitude: json['latitude'] ?? '',
    roomCount: json['roomCount'] ?? 0,
    bedroomCount: json['bedroomCount'] ?? 0,
    livingRoomCount: json['livingRoomCount'] ?? 0,
    kitchenCount: json['kitchenCount'] ?? 0,
    bathroomCount: json['bathroomCount'] ?? 0,
    hasFurniture: json['hasFurniture'] ?? '',
    officeId: json['officeId'] ?? 0,
    officeName: json['officeName'] ?? '',
    officeLocation: json['officeLocation'] ?? '',
    electricity: json['electricity'] ?? '',
    water: json['water'] ?? '',
    pool: json['pool'] ?? '',
    additionalServices: List<String>.from(json['additionalServices'] ?? []),
    area: (json['area'] ?? 0).toDouble(),
    location: json['location'] ?? '',
    price: (json['price'] ?? 0).toDouble(),
    listingType: json['listingType'] ?? '',
    type: json['type'] ?? '',
    rate:
        (json['rate'] != null)
            ? double.tryParse(json['rate'].toString()) ?? 0.0
            : 0.0,
    avgRate: (json['avg_rate'] ?? 0).toDouble(),
    isFavorite: (json['is_favorite'] ?? 0) == 1,
    office:
        json['office'] != null
            ? OfficeDto.fromJson(json['office'])
            : OfficeDto.empty(),
  );

  Map<String, dynamic> toJson() => {
    'propertyId': propertyId,
    'postImage': postImage,
    'postTitle': postTitle,
    'description': description,
    'date': date,
    'images': images,
    'longitude': longitude,
    'latitude': latitude,
    'roomCount': roomCount,
    'bedroomCount': bedroomCount,
    'livingRoomCount': livingRoomCount,
    'kitchenCount': kitchenCount,
    'bathroomCount': bathroomCount,
    'hasFurniture': hasFurniture,
    'officeId': officeId,
    'officeName': officeName,
    'officeLocation': officeLocation,
    'electricity': electricity,
    'water': water,
    'pool': pool,
    'additionalServices': additionalServices,
    'area': area,
    'location': location,
    'price': price,
    'listingType': listingType,
    'type': type,
    'rate': rate,
    'avg_rate': avgRate,
    'is_favorite': isFavorite ? 1 : 0,
  };

  factory TourismModel.empty() => TourismModel(
    propertyId: 0,
    postImage: '',
    postTitle: 'عنوان سياحي',
    description: '',
    date: '',
    images: [],
    longitude: '',
    latitude: '',
    roomCount: 0,
    bedroomCount: 0,
    livingRoomCount: 0,
    kitchenCount: 0,
    bathroomCount: 0,
    hasFurniture: '',
    officeId: 0,
    officeName: '',
    officeLocation: '',
    electricity: '',
    water: '',
    pool: '',
    additionalServices: [],
    area: 0.0,
    location: 'الموقع',
    price: 0.0,
    listingType: 'أجار',
    type: 'سياحي',
    rate: 0.0,
    avgRate: 0.0,
    isFavorite: true,
    office: OfficeDto.empty(),
  );
}
