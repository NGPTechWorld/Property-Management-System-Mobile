import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/features/widgets/card_filter.dart';

import 'package:property_ms/features/widgets/tourisem_card.dart';
import 'package:property_ms/features/widgets/tourisem_card_small.dart';

class TourisemController extends GetxController {
  final sliderIndex = 0.obs;
  final selectedFilterIndex = 0.obs;
  final selectedSumFilterIndex = 0.obs;

  final isFiltterShow = false.obs;
  late final List<CardFilterModel> cardFilters = [
    CardFilterModel(title: "الكل"),
    CardFilterModel(title: "سياحي", icon: Assets.icons.tourisem),
    CardFilterModel(title: "عقاري", icon: Assets.icons.property),
  ];
  late final List<CardFilterModel> cardSubFilters = [
    CardFilterModel(title: "الكل"),
  ];

  final tourisemSlider = [
    TourisemCardModel(
      title: 'شقة 100 م²',
      location: 'دمشق, شعلان',
      priceUnit: 'شهري',
      rate: 4.5,
      price: 2500,
      image: Assets.images.property,
    ),
    TourisemCardModel(
      title: 'شقة 100 م²',
      location: 'دمشق, شعلان',
      priceUnit: 'شهري',
      rate: 4.5,
      price: 2500,
      image: Assets.images.property,
    ),
    TourisemCardModel(
      title: 'شقة 100 م²',
      location: 'دمشق, شعلان',
      priceUnit: 'شهري',
      rate: 4.5,
      price: 2500,
      image: Assets.images.property,
    ),
  ];

  final allTourisems = [
    TourisemCardSmallModel(
      title: "مزرعة",
      location: "ريف دمشق, الزبداني",
      area: 200,
      price: 1500,
      image: Assets.images.tourisem,
    ),
    TourisemCardSmallModel(
      title: "مزرعة",
      location: "ريف دمشق, الزبداني",
      area: 200,
      price: 1500,
      image: Assets.images.tourisem,
    ),
    TourisemCardSmallModel(
      title: "مزرعة",
      location: "ريف دمشق, الزبداني",
      area: 200,
      price: 1500,
      image: Assets.images.tourisem,
    ),
    TourisemCardSmallModel(
      title: "مزرعة",
      location: "ريف دمشق, الزبداني",
      area: 200,
      price: 1500,
      image: Assets.images.tourisem,
    ),
    TourisemCardSmallModel(
      title: "مزرعة",
      location: "ريف دمشق, الزبداني",
      area: 200,
      price: 1500,
      image: Assets.images.tourisem,
    ),
  ];

  void selectFilter(int index) {
    selectedFilterIndex.value = index;
  }
  openFilterPagePro() {
    
  }
}
