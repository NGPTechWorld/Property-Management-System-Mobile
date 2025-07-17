import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/data/entity/services_card_model.dart';
import 'package:property_ms/data/enums/property_service_provider_type_enum.dart';
import 'package:property_ms/features/widgets/card_filter.dart';

class ServicesController extends GetxController {
  RxInt selectedFilterIndex = 0.obs;
  RxBool isFiltterShow = false.obs;
  List<CardFilterModel> cardFiltter =
      PropertyServiceProviderType.values
          .map((e) => CardFilterModel(title: e.value))
          .toList();
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

  void selectFilter(int index) {
    selectedFilterIndex.value = index;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
