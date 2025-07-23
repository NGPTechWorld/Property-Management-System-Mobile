import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/widgets/custom_toasts.dart';
import 'package:property_ms/data/dto/rent_dto.dart';
import 'package:property_ms/data/entity/services_card_model.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/data/repos/property_repositories.dart';
import 'package:property_ms/features/main_page/main_controller.dart';
import 'package:property_ms/features/widgets/office_card.dart';

class HomeController extends GetxController {
  final PropertyRepositories propertyRepo = Get.find<PropertyRepositories>();
  final mainController = Get.find<MainController>();

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
    getTopRateTourisem();
  }

  Future<void> refreshPage() async {
    topPropertList.clear();
    pageTopPropert.value = 1;
    hasMoreTopPropert.value = true;
    await getTopRateProperty();

    topTourisemList.clear();
    pageTopTourisem.value = 1;
    hasMoreTopTourisem.value = true;
    await getTopRateTourisem();
  }

  void initScrollControllers() {
    scrollTopPropertController.addListener(() {
      if (scrollTopPropertController.position.maxScrollExtent ==
          scrollTopPropertController.offset) {
        getTopRateProperty(firstPage: false);
      }
    });
    scrollTopTourisemController.addListener(() {
      if (scrollTopTourisemController.position.maxScrollExtent ==
          scrollTopTourisemController.offset) {
        getTopRateTourisem(firstPage: false);
      }
    });
  }

  //? Get Top Property

  final loadingTopPropertState = LoadingState.loading.obs;
  final topPropertList = <RentCardDto>[].obs;
  final pageTopPropert = 1.obs;
  final perPage = 5;
  final hasMoreTopPropert = false.obs;
  final scrollTopPropertController = ScrollController();

  Future<void> getTopRateProperty({bool firstPage = true}) async {
    if (firstPage) {
      pageTopPropert.value = 1;
      hasMoreTopPropert.value = true;
    }
    if (!hasMoreTopPropert.value) {
      loadingTopPropertState.value = LoadingState.doneWithNoData;
      return;
    }
    loadingTopPropertState.value = LoadingState.loading;
    await Future.delayed(const Duration(seconds: 3));
    final response = await propertyRepo.getTopRateProperty(
      perPage: perPage,
      page: pageTopPropert.value,
      type: "عقار سكني",
    );
    if (!response.success) {
      loadingTopPropertState.value = LoadingState.hasError;
      hasMoreTopPropert.value = false;
      CustomToasts(
        message: response.getErrorMessage(),
        type: CustomToastType.error,
      ).show();
      return;
    }
    hasMoreTopPropert.value = false;
    firstPage
        ? topPropertList.value = response.data?.data ?? []
        : topPropertList.addAll(response.data!.data);
    log(topPropertList.length.toString());
    log(response.data!.data.toString());
    hasMoreTopPropert.value = topPropertList.length < response.data!.totalItems;
    loadingTopPropertState.value =
        firstPage && topPropertList.isEmpty
            ? LoadingState.doneWithNoData
            : LoadingState.doneWithData;
    if (hasMoreTopPropert.value) {
      pageTopPropert.value++;
    }
  }

  //?=================
  //? Get Top Property

  final loadingTopTourisemState = LoadingState.loading.obs;
  final topTourisemList = <RentCardDto>[].obs;
  final pageTopTourisem = 1.obs;
  final hasMoreTopTourisem = false.obs;
  final scrollTopTourisemController = ScrollController();

  Future<void> getTopRateTourisem({bool firstPage = true}) async {
    if (firstPage) {
      pageTopTourisem.value = 1;
      hasMoreTopTourisem.value = true;
    }
    if (!hasMoreTopTourisem.value) {
      loadingTopTourisemState.value = LoadingState.doneWithNoData;
      return;
    }
    loadingTopTourisemState.value = LoadingState.loading;
    await Future.delayed(const Duration(seconds: 3));
    final response = await propertyRepo.getTopRateProperty(
      perPage: perPage,
      page: pageTopTourisem.value,
      type: "عقار سياحي",
    );
    if (!response.success) {
      loadingTopTourisemState.value = LoadingState.hasError;
      hasMoreTopTourisem.value = false;
      CustomToasts(
        message: response.getErrorMessage(),
        type: CustomToastType.error,
      ).show();
      return;
    }
    hasMoreTopTourisem.value = false;
    firstPage
        ? topTourisemList.value = response.data?.data ?? []
        : topTourisemList.addAll(response.data!.data);
    log(topTourisemList.length.toString());
    log(response.data!.data.toString());
    hasMoreTopTourisem.value =
        topTourisemList.length < response.data!.totalItems;
    loadingTopTourisemState.value =
        firstPage && topTourisemList.isEmpty
            ? LoadingState.doneWithNoData
            : LoadingState.doneWithData;
    if (hasMoreTopTourisem.value) {
      pageTopTourisem.value++;
    }
  }

  //?=================
}
