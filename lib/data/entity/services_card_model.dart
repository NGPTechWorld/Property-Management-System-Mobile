import 'package:property_ms/core/utils/assets.gen.dart';

class ServicesCardModel {
  final String title;
  final String location;
  final String tupe;
  final double rate;
  final AssetGenImage image;
  ServicesCardModel({
    required this.title,
    required this.location,
    required this.tupe,
    required this.rate,
    required this.image,
  });
}