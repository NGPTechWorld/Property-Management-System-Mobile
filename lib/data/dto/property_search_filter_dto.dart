class PropertySearchFilterDto {
  final int regionId;
  final int cityId;
  final String listingType;
  final int minPrice;
  final int maxPrice;
  final double minArea;
  final double maxArea;
  final String status;
  final String hasFurniture;
  final String direction;
  final String ownershipType;
  final int floorNumber;
  final String tag;
  final RoomDetailsDto roomDetails;

  PropertySearchFilterDto({
    required this.regionId,
    required this.cityId,
    required this.listingType,
    required this.minPrice,
    required this.maxPrice,
    required this.minArea,
    required this.maxArea,
    required this.status,
    required this.hasFurniture,
    required this.direction,
    required this.ownershipType,
    required this.floorNumber,
    required this.tag,
    required this.roomDetails,
  });

  factory PropertySearchFilterDto.fromJson(Map<String, dynamic> json) {
    return PropertySearchFilterDto(
      regionId: json['regionId'] ?? 0,
      cityId: json['cityId'] ?? 0,
      listingType: json['listing_type'] ?? '',
      minPrice: json['minPrice'] ?? 0,
      maxPrice: json['maxPrice'] ?? 0,
      minArea: (json['minArea'] ?? 0).toDouble(),
      maxArea: (json['maxArea'] ?? 0).toDouble(),
      status: json['status'] ?? '',
      hasFurniture: json['has_furniture'] ?? false,
      direction: json['direction'] ?? '',
      ownershipType: json['ownership_type'] ?? '',
      floorNumber: json['floor_number'] ?? 0,
      tag: json['tag'] ?? '',
      roomDetails: RoomDetailsDto.fromJson(json['room_details'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
    'regionId': regionId,
    'cityId': cityId,
    'listing_type': listingType,
    'minPrice': minPrice,
    'maxPrice': maxPrice,
    'minArea': minArea,
    'maxArea': maxArea,
    'status': status,
    'has_furniture': hasFurniture,
    'direction': direction,
    'ownership_type': ownershipType,
    'floor_number': floorNumber,
    'tag': tag,
    'room_details': roomDetails.toJson(),
  };

  factory PropertySearchFilterDto.empty() => PropertySearchFilterDto(
    regionId: 0,
    cityId: 0,
    listingType: '',
    minPrice: 0,
    maxPrice: 0,
    minArea: 0,
    maxArea: 0,
    status: '',
    hasFurniture: '',
    direction: '',
    ownershipType: '',
    floorNumber: 0,
    tag: '',
    roomDetails: RoomDetailsDto.empty(),
  );
}

class RoomDetailsDto {
  final int roomCount;
  final int bedroomCount;
  final int livingRoomCount;
  final int kitchenCount;
  final int bathroomCount;

  RoomDetailsDto({
    required this.roomCount,
    required this.bedroomCount,
    required this.livingRoomCount,
    required this.kitchenCount,
    required this.bathroomCount,
  });

  factory RoomDetailsDto.fromJson(Map<String, dynamic> json) {
    return RoomDetailsDto(
      roomCount: json['room_count'] ?? 0,
      bedroomCount: json['bedroom_count'] ?? 0,
      livingRoomCount: json['living_room_count'] ?? 0,
      kitchenCount: json['kitchen_count'] ?? 0,
      bathroomCount: json['bathroom_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    'room_count': roomCount,
    'bedroom_count': bedroomCount,
    'living_room_count': livingRoomCount,
    'kitchen_count': kitchenCount,
    'bathroom_count': bathroomCount,
  };

  factory RoomDetailsDto.empty() => RoomDetailsDto(
    roomCount: 0,
    bedroomCount: 0,
    livingRoomCount: 0,
    kitchenCount: 0,
    bathroomCount: 0,
  );
}
