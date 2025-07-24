// property_details_controller.dart
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/features/property_page/sub_pages/property_details/model/property_details_model.dart';
import 'package:property_ms/features/widgets/office_card.dart';
import 'package:property_ms/features/widgets/property_rent_card.dart';
import 'package:property_ms/features/widgets/property_sale_card.dart';

class PropertyDetailsController extends GetxController {
  final RxInt sliderIndex = 0.obs;
  final isLoadingImages = true.obs;

  final ScrollController scrollController = ScrollController();
  RxBool isFavorite = false.obs;
  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
    propertyDetails.isFavorite = isFavorite.value; // Optional: sync with model
  }
  // late PropertyDetailsModel propertyDetails;

  final propertyDetails = PropertyDetailsModel(
    title: "بيت أبو العود",
    description: 'هذا العقار يقع في مكان مميز جدا في حي راقي',
    publishDate: "2015/4/23",
    status: "للبيع",
    location: "ريف,دمشق قدسيا",
    area: "120 م²",
    ownershipType: "سكني",
    orientation: "جنوبية",
    furnishing: "مفروش",
    roomCount: 3,
    installmentAvailable: "متاح",
    floor: "الثالث",
    price: '\$30,000',
    roomDetails: RoomDetails(
      bedrooms: 2,
      livingRooms: 1,
      bathrooms: 2,
      kitchens: 1,
    ),
    images: [
      Assets.images.officePropertyCard,
      Assets.images.officeServicesCard,
      Assets.images.propertyCard,
    ],
    responsibleOffice: OfficeCardModel(
      title: 'مكتب أبو فراس',
      type: 'عقاري',
      location: 'دمشق, ميدان',
      rate: 4.75,
      image: Assets.images.propertyImage,
    ),
    isFavorite: false,
  );

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
  ];

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 2), () {
      isLoadingImages.value = false;
    });
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
