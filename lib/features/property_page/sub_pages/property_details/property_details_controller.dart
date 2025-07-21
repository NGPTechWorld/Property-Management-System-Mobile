import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/features/widgets/office_card.dart';
import 'package:property_ms/features/widgets/property_rent_card.dart';
import 'package:property_ms/features/widgets/property_sale_card.dart';

class PropertyDetailsController extends GetxController {
  final RxInt sliderIndex = 0.obs;
  var isLoadingImages = true.obs;
  var isLoadingOffice = true.obs;
  var isLoadingProperty = true.obs;
  var isLoadingRooms = true.obs;
  var isLoadingRelated = true.obs;
  final ScrollController scrollController = ScrollController();

  //For carousel
  final images = [
    Assets.images.officePropertyCard,
    Assets.images.officeServicesCard,
    Assets.images.propertyCard,
  ];

  // repsonsible office model
  final repsonsibleOffice = OfficeCardModel(
    title: 'مكتب أبو فراس',
    type: 'عقاري',
    location: 'دمشق, ميدان',
    rate: 4.75,
    image: Assets.images.propertyImage,
  );

  // For recommended properties
  final propertyList = [
    PropertyRentCardModel(
      title: 'شقة 100 م²',
      location: 'دمشق, شعلان',
      priceUnit: 'شهري',
      rate: 4.5,
      price: 2500,
      image: Assets.images.propertyImage,
    ),
    PropertySaleCardModel(
      title: 'بيت 120 م²',
      location: 'دمشق القديمة',
      area: 120,
      price: 2500,
      image: Assets.images.officePropertyCard,
    ),
    PropertyRentCardModel(
      title: 'شقة 120 م²',
      location: 'دمشق, أبو رمانة',
      priceUnit: 'شهري',
      rate: 4.8,
      price: 3000,
      image: Assets.images.propertyImage,
    ),
    PropertyRentCardModel(
      title: 'بيت عربي',
      location: 'دمشق القديمة',
      priceUnit: 'شهري',
      rate: 4.2,
      price: 1800,
      image: Assets.images.propertyImage,
    ),
  ];
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 2), () {
      isLoadingImages.value = false;
      isLoadingOffice.value = false;
    });
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
