import 'package:get/get.dart';
import 'package:property_ms/features/widgets/tourisem_card_small.dart';

class TourismDetailsController extends GetxController {
  // tourism detail model id
  final TourisemCardSmallModel tourism =
      Get.arguments as TourisemCardSmallModel;
}
