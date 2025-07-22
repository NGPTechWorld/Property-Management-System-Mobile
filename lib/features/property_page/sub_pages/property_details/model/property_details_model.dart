import 'package:property_ms/features/widgets/office_card.dart';

class PropertyDetailsModel {
  final String title;
  final String publishDate;
  final String status;
  final String location;
  final String area;
  final String ownershipType;
  final String orientation;
  final String furnishing;
  final int roomCount;
  final String installmentAvailable;
  final String floor;
  final RoomDetails roomDetails;
  final List images;
  final OfficeCardModel responsibleOffice;
  final String price;

  PropertyDetailsModel({
    required this.title,
    required this.publishDate,
    required this.status,
    required this.location,
    required this.area,
    required this.ownershipType,
    required this.orientation,
    required this.furnishing,
    required this.roomCount,
    required this.installmentAvailable,
    required this.floor,
    required this.roomDetails,
    required this.images,
    required this.responsibleOffice,
    required this.price,
  });
}

class RoomDetails {
  final int bedrooms;
  final int livingRooms;
  final int bathrooms;
  final int kitchens;

  RoomDetails({
    required this.bedrooms,
    required this.livingRooms,
    required this.bathrooms,
    required this.kitchens,
  });
}
