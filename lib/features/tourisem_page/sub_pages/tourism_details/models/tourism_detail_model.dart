
import 'package:property_ms/data/dto/office_dto.dart';

class TourismDetailModel {
  final String title;
  final String description;
  final String publishDate;
  final String location;
  final String area;
  final String furnishing;
  final String electricity;
  final String water;
  final String pool;
  final RoomDetails roomDetails;
  final List<String> images;
  final OfficeDto responsibleOffice;
  final List<String> features;
  final String price;
  final String payRate;
  bool isFavorite;

  TourismDetailModel({
    required this.title,
    required this.description,
    required this.publishDate,
    required this.location,
    required this.area,
    required this.furnishing,
    required this.electricity,
    required this.water,
    required this.pool,
    required this.roomDetails,
    required this.images,
    required this.responsibleOffice,
    required this.features,
    required this.price,
    required this.payRate,
    required this.isFavorite,
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
