import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/data/entity/services_card_model.dart';

import 'package:property_ms/features/widgets/card_filter.dart';

class ServicesController extends GetxController {
  final topServices = [
    ServicesCardModel(
      title: "ابو يحيى",
      location: 'دمشق القديمة',
      tupe: "تصوير احترافي",
      rate: 4.3,
      image: Assets.images.propertyImage,
    ),
    ServicesCardModel(
      title: "ابو يحيى",
      location: 'دمشق القديمة',
      tupe: "تصوير احترافي",
      rate: 4.3,
      image: Assets.images.propertyImage,
    ),
    ServicesCardModel(
      title: "ابو يحيى",
      location: 'دمشق القديمة',
      tupe: "تصوير احترافي",
      rate: 4.3,
      image: Assets.images.propertyImage,
    ),
  ];

  RxInt selectedFilterIndex = 0.obs;
  RxBool isFiltterShow = false.obs;

  final cardFilters = [];
  void selectFilter(int index) {
    selectedFilterIndex.value = index;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    cardFilters.assignAll([
      CardFilterModel(title: "الكل", index: 0, onTap: () => selectFilter(0)),
      CardFilterModel(title: "كهربائي", index: 1, onTap: () => selectFilter(1)),
      CardFilterModel(title: "صحية", index: 2, onTap: () => selectFilter(2)),
      CardFilterModel(title: "صيانة", index: 3, onTap: () => selectFilter(3)),
    ]);
  }
}
