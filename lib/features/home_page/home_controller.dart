import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/widgets/custom_toasts.dart';
import 'package:property_ms/data/dto/property_dto.dart';
import 'package:property_ms/data/entity/services_card_model.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/data/repos/property_repositories.dart';
import 'package:property_ms/features/main_page/main_controller.dart';
import 'package:property_ms/features/widgets/office_card.dart';
import 'package:property_ms/features/widgets/property_rent_card.dart';
import 'package:property_ms/features/widgets/property_sale_card.dart';

class HomeController extends GetxController {
  final PropertyRepositories propertyRepo = Get.find<PropertyRepositories>();
  final mainController = Get.find<MainController>();
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
  final topOffices = [
    OfficeCardModel(
      title: "مكتب ابو سمير",
      type: "سياحي",
      location: 'دمشق القديمة',
      rate: 4.5,
      image: Assets.images.propertyImage,
    ),
    OfficeCardModel(
      title: "مكتب ابو سمير",
      type: "سياحي",
      location: 'دمشق القديمة',
      rate: 4.5,
      image: Assets.images.propertyImage,
    ),
    OfficeCardModel(
      title: "مكتب ابو سمير",
      type: "سياحي",
      location: 'دمشق القديمة',
      rate: 4.5,
      image: Assets.images.propertyImage,
    ),
    OfficeCardModel(
      title: "مكتب ابو سمير",
      type: "سياحي",
      location: 'دمشق القديمة',
      rate: 4.5,
      image: Assets.images.propertyImage,
    ),
  ];

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

  @override
  void onInit() {
    super.onInit();
    initScrollControllers();
    getTopRateProperty();
  }

  Future<void> refreshPage() async {
    topPropertList.clear();
    page.value = 1;
    hasMoreAds.value = true;
    await getTopRateProperty();
  }

  void initScrollControllers() {
    scrollTopPropertController.addListener(() {
      if (scrollTopPropertController.position.maxScrollExtent ==
          scrollTopPropertController.offset) {
        getTopRateProperty(firstPage: false);
      }
    });
  }

  //? Get Top Property

  final loadingTopPropertState = LoadingState.loading.obs;
  final topPropertList = <PropertyDto>[].obs;
  final page = 1.obs;
  final perPage = 5;
  final hasMoreAds = false.obs;
  final scrollTopPropertController = ScrollController();

  Future<void> getTopRateProperty({bool firstPage = true}) async {
    loadingTopPropertState.value = LoadingState.loading;
    await Future.delayed(const Duration(seconds: 3));
    if (firstPage) {
      page.value = 1;
      hasMoreAds.value = true;
    }
    if (!hasMoreAds.value) return;
    final response = await propertyRepo.getTopRateProperty(
      perPage: perPage,
      page: page.value,
      type: "عقار سكني",
    );
    if (!response.success) {
      loadingTopPropertState.value = LoadingState.hasError;
      hasMoreAds.value = false;
      CustomToasts(
        message: response.getErrorMessage(),
        type: CustomToastType.error,
      ).show();
      return;
    }
    hasMoreAds.value = false;
    firstPage
        ? topPropertList.value = response.data?.data ?? []
        : topPropertList.addAll(response.data!.data);
    log(topPropertList.length.toString());
    log(response.data!.data.toString());
    hasMoreAds.value = topPropertList.length < response.data!.totalItems;
    loadingTopPropertState.value =
        firstPage && topPropertList.isEmpty
            ? LoadingState.doneWithNoData
            : LoadingState.doneWithData;
    if (hasMoreAds.value) {
      page.value++;
    }
  }

  //?=================
}
