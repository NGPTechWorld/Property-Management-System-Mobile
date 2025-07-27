import 'package:property_ms/data/dto/office_dto.dart';

class PropertyModel {
  final int propertyId;
  final String postTitle;
  final String postDescription;
  final String postImage;
  final String postDate;
  final String postStatus;
  final double area;
  final String propertyType;
  final String ownershipType;
  final String direction;
  final String status;
  final Coordinates coordinates;
  final int floorNumber;
  final double avgRate;
  final String notes;
  final bool highlighted;
  final RoomCounts roomCounts;
  final String hasFurniture;
  final String location;
  final Region region;
  final City city;
  final List<ImageModel> images;
  final String tag;
  final String listingType;
  final SellDetails? sellDetails;
  final RentDetails? rentDetails;
  final bool isFavorite;
  final OfficeDto office;

  PropertyModel({
    required this.propertyId,
    required this.postTitle,
    required this.postDescription,
    required this.postImage,
    required this.postDate,
    required this.postStatus,
    required this.area,
    required this.propertyType,
    required this.ownershipType,
    required this.direction,
    required this.status,
    required this.coordinates,
    required this.floorNumber,
    required this.avgRate,
    required this.notes,
    required this.highlighted,
    required this.roomCounts,
    required this.hasFurniture,
    required this.location,
    required this.region,
    required this.city,
    required this.images,
    required this.tag,
    required this.listingType,
    required this.sellDetails,
    required this.rentDetails,
    required this.isFavorite,
    required this.office,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) => PropertyModel(
    propertyId: json['propertyId'] ?? 0,
    postTitle: json['postTitle'] ?? '',
    postDescription: json['postDescription'] ?? '',
    postImage: json['postImage'] ?? '',
    postDate: json['postDate'] ?? '',
    postStatus: json['PostStatus'] ?? '',
    area: (json['area'] ?? 0).toDouble(),
    propertyType: json['property_type'] ?? '',
    ownershipType: json['ownership_type'] ?? '',
    direction: json['direction'] ?? '',
    status: json['status'] ?? '',
    coordinates: Coordinates.fromJson(json['coordinates'] ?? {}),
    floorNumber: json['floor_number'] ?? 0,
    avgRate: double.tryParse(json['avg_rate']?.toString() ?? '') ?? 0.0,

    notes: json['notes'] ?? '',
    highlighted: json['highlighted'] ?? false,
    roomCounts: RoomCounts.fromJson(json['room_counts'] ?? {}),
    hasFurniture: json['has_furniture'] ?? "",
    location: json['location'] ?? '',
    region: Region.fromJson(json['region'] ?? {}),
    city: City.fromJson(json['city'] ?? {}),
    images:
        (json['images'] as List<dynamic>? ?? [])
            .map((e) => ImageModel.fromJson(e))
            .toList(),
    tag: json['tag'] ?? '',
    listingType: json['listing_type'] ?? '',
    sellDetails:
        json['sell_details'] != null
            ? SellDetails.fromJson(json['sell_details'])
            : null,
    rentDetails:
        json['rent_details'] != null
            ? RentDetails.fromJson(json['rent_details'])
            : null,
    isFavorite: (json['is_favorite'] ?? 0) == 1,
    office: OfficeDto.fromJson(json['office'] ?? {}),
  );
}

class Coordinates {
  final String latitude;
  final String longitude;

  Coordinates({required this.latitude, required this.longitude});

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
    latitude: json['latitude'] ?? '',
    longitude: json['longitude'] ?? '',
  );
}

class RoomCounts {
  final int total;
  final int bedroom;
  final int livingRoom;
  final int kitchen;
  final int bathroom;

  RoomCounts({
    required this.total,
    required this.bedroom,
    required this.livingRoom,
    required this.kitchen,
    required this.bathroom,
  });

  factory RoomCounts.fromJson(Map<String, dynamic> json) => RoomCounts(
    total: json['total'] ?? 0,
    bedroom: json['bedroom'] ?? 0,
    livingRoom: json['living_room'] ?? 0,
    kitchen: json['kitchen'] ?? 0,
    bathroom: json['bathroom'] ?? 0,
  );
}

class Region {
  final int id;
  final String name;

  Region({required this.id, required this.name});

  factory Region.fromJson(Map<String, dynamic> json) =>
      Region(id: json['id'] ?? 0, name: json['name'] ?? '');
}

class City {
  final int id;
  final String name;

  City({required this.id, required this.name});

  factory City.fromJson(Map<String, dynamic> json) =>
      City(id: json['id'] ?? 0, name: json['name'] ?? '');
}

class ImageModel {
  final int id;
  final String imageUrl;

  ImageModel({required this.id, required this.imageUrl});

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      ImageModel(id: json['id'] ?? 0, imageUrl: json['image_url'] ?? '');
}

class SellDetails {
  final int sellingPrice;
  final bool installmentAllowed;
  final int installmentDuration;

  SellDetails({
    required this.sellingPrice,
    required this.installmentAllowed,
    required this.installmentDuration,
  });

  factory SellDetails.fromJson(Map<String, dynamic> json) => SellDetails(
    sellingPrice: json['selling_price'] ?? 0,
    installmentAllowed: json['installment_allowed'] ?? false,
    installmentDuration: json['installment_duration'] ?? 0,
  );
}

class RentDetails {
  final int price;
  final String rentalPeriod;

  RentDetails({required this.price, required this.rentalPeriod});

  factory RentDetails.fromJson(Map<String, dynamic> json) => RentDetails(
    price: json['price'] ?? 0,
    rentalPeriod: json['rental_period'] ?? "",
  );
}
