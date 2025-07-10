import 'package:get/get.dart';
import 'package:property_ms/features/widgets/office_card.dart';

class OfficeDetailsController extends GetxController {
  late final OfficeCardModel office;

  @override
  void onInit() {
    office = Get.arguments as OfficeCardModel;
    super.onInit();
  }
}