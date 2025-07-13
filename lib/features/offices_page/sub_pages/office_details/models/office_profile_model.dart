import 'package:property_ms/core/utils/assets.gen.dart';

class OfficeProfileModel {
  final String title;
  final AssetGenImage image;
  final String serviceType;
  final String rate;
  final String location;
  final String startWork;
  final String endWork;
  final String officeNumber;

  OfficeProfileModel({
    required this.title,
    required this.image,
    required this.serviceType,
    required this.rate,
    required this.location,
    required this.startWork,
    required this.endWork,
    required this.officeNumber,
  });
}
