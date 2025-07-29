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
      hasFurniture: json['has_furniture'] ?? '',
      direction: json['direction'] ?? '',
      ownershipType: json['ownership_type'] ?? '',
      floorNumber: json['floor_number'] ?? 0,
      tag: json['tag'] ?? '',
      roomDetails: RoomDetailsDto.fromJson(json['room_details'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    if (regionId != 0) data['regionId'] = regionId;
    if (cityId != 0) data['cityId'] = cityId;
    if (listingType.isNotEmpty) data['listing_type'] = listingType;
    if (minPrice != 0) data['minPrice'] = minPrice;
    if (maxPrice != 0) data['maxPrice'] = maxPrice;
    if (minArea != 0) data['minArea'] = minArea;
    if (maxArea != 0) data['maxArea'] = maxArea;
    if (status.isNotEmpty) data['status'] = status;
    if (hasFurniture.isNotEmpty) data['has_furniture'] = hasFurniture;
    if (direction.isNotEmpty) data['direction'] = direction;
    if (ownershipType.isNotEmpty) data['ownership_type'] = ownershipType;
    if (floorNumber != 0) data['floor_number'] = floorNumber;
    if (tag.isNotEmpty) data['tag'] = tag;

    final roomData = roomDetails.toJson();
    if (roomData.isNotEmpty) data['room_details'] = roomData;

    return data;
  }

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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    if (roomCount != 0) data['room_count'] = roomCount;
    if (bedroomCount != 0) data['bedroom_count'] = bedroomCount;
    if (livingRoomCount != 0) data['living_room_count'] = livingRoomCount;
    if (kitchenCount != 0) data['kitchen_count'] = kitchenCount;
    if (bathroomCount != 0) data['bathroom_count'] = bathroomCount;

    return data;
  }

  factory RoomDetailsDto.empty() => RoomDetailsDto(
    roomCount: 0,
    bedroomCount: 0,
    livingRoomCount: 0,
    kitchenCount: 0,
    bathroomCount: 0,
  );
}
