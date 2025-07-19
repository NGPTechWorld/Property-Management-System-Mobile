import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/features/widgets/office_card.dart';
import 'package:property_ms/features/widgets/property_rent_card2_small.dart';
import 'package:property_ms/features/widgets/property_sale_card2_small.dart';

class OfficeDetailsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // office model id
  final OfficeCardModel office = Get.arguments as OfficeCardModel;

  // filter
  RxInt selectedFilterIndex = 0.obs;
  RxBool isFiltterShow = false.obs;

  void selectFilter(int index) {
    selectedFilterIndex.value = index;
    updateFilteredProperties();
  }

  // officeProperties
  final officeProperties = [
    PropertyRentCard2SmallModel(
      title: 'شقة',
      location: 'دمشق, المزة',
      priceUnit: 'شهري',
      rate: 4.5,
      price: 1800,
      image: Assets.images.officePropertyCard,
    ),
    PropertySaleCard2SmallModel(
      title: 'شقة',
      location: 'دمشق, أبو رمانة',
      area: 70,
      price: 3200,
      image: Assets.images.officePropertyCard,
    ),
    PropertyRentCard2SmallModel(
      title: 'شقة',
      location: 'دمشق, البرامكة',
      priceUnit: 'شهري',
      rate: 4.2,
      price: 2100,
      image: Assets.images.officePropertyCard,
    ),
    PropertySaleCard2SmallModel(
      title: 'شقة',
      location: 'دمشق, الحريقة',
      area: 90,
      price: 4000,
      image: Assets.images.officePropertyCard,
    ),
    PropertyRentCard2SmallModel(
      title: 'شقة',
      location: 'دمشق, المالكي',
      priceUnit: 'شهري',
      rate: 4.8,
      price: 3500,
      image: Assets.images.officePropertyCard,
    ),
    PropertySaleCard2SmallModel(
      title: 'شقة',
      location: 'دمشق, الشعلان',
      area: 60,
      price: 2800,
      image: Assets.images.officePropertyCard,
    ),
    PropertyRentCard2SmallModel(
      title: 'شقة',
      location: 'دمشق, الميدان',
      priceUnit: 'شهري',
      rate: 4.0,
      price: 1400,
      image: Assets.images.officePropertyCard,
    ),
    PropertySaleCard2SmallModel(
      title: 'شقة',
      location: 'دمشق, ساحة يوسف العظمة',
      area: 100,
      price: 5000,
      image: Assets.images.officePropertyCard,
    ),
    PropertyRentCard2SmallModel(
      title: 'شقة',
      location: 'دمشق, الصناعة',
      priceUnit: 'شهري',
      rate: 3.9,
      price: 1300,
      image: Assets.images.officePropertyCard,
    ),
    PropertySaleCard2SmallModel(
      title: 'شقة',
      location: 'دمشق, المزرعة',
      area: 85,
      price: 4200,
      image: Assets.images.officePropertyCard,
    ),
  ];

  //! Tabbar
  late TabController tabController;

  final tabs = ["جميع العقارات", "معلومات الحساب"];

  //! list obs for filter

  RxList<dynamic> filteredProperties = <dynamic>[].obs;

  void updateFilteredProperties() {
    if (selectedFilterIndex.value == 0) {
      // Show all
      filteredProperties.assignAll(officeProperties);
    } else if (selectedFilterIndex.value == 1) {
      // Example filter for rent properties
      filteredProperties.assignAll(
        officeProperties
            .where((p) => p is PropertyRentCard2SmallModel)
            .toList(),
      );
    } else if (selectedFilterIndex.value == 2) {
      // Example filter for sale properties
      filteredProperties.assignAll(
        officeProperties
            .where((p) => p is PropertySaleCard2SmallModel)
            .toList(),
      );
    }
  }

  @override
  void onInit() {
    // Tabbar
    tabController = TabController(length: tabs.length, vsync: this);

    filteredProperties.assignAll(officeProperties);

    //! @OsamaZerkawi first of init  Call the API for getting properties and profile details
    super.onInit();
  }

  @override
  void onClose() {
    // Tabbar
    tabController.dispose();
    super.onClose();
  }
}
