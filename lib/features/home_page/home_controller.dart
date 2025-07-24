import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/widgets/custom_toasts.dart';
import 'package:property_ms/data/dto/office_dto.dart';
import 'package:property_ms/data/dto/rent_dto.dart';
import 'package:property_ms/data/dto/service_dto.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/data/repos/offices_repositories.dart';
import 'package:property_ms/data/repos/property_repositories.dart';
import 'package:property_ms/data/repos/services_repositories.dart';
import 'package:property_ms/features/main_page/main_controller.dart';

class HomeController extends GetxController {
  final PropertyRepositories propertyRepo = Get.find<PropertyRepositories>();
  final OfficesRepositories officeRepo = Get.find<OfficesRepositories>();
  final ServicesRepositories serviceRepo = Get.find<ServicesRepositories>();
  final mainController = Get.find<MainController>();

  @override
  void onInit() {
    super.onInit();
    initScrollControllers();
    getTopRateProperty();
    getTopRateTourisem();
    getTopRateOffice();
    getTopRateService();
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

    topOfficeList.clear();
    pageTopOffice.value = 1;
    hasMoreTopOffice.value = true;
    await getTopRateOffice();

    topServiceList.clear();
    pageTopService.value = 1;
    hasMoreTopService.value = true;
    await getTopRateService();
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
    scrollTopOfficeController.addListener(() {
      if (scrollTopOfficeController.position.maxScrollExtent ==
          scrollTopOfficeController.offset) {
        getTopRateOffice(firstPage: false);
      }
    });
    scrollTopServiceController.addListener(() {
      if (scrollTopServiceController.position.maxScrollExtent ==
          scrollTopServiceController.offset) {
        getTopRateService(firstPage: false);
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
      type: "عقاري",
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
  //? Get Top Tourisem

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
      type: "سياحي",
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

  //? Get Top Office

  final loadingTopOfficeState = LoadingState.loading.obs;
  final topOfficeList = <OfficeDto>[].obs;
  final pageTopOffice = 1.obs;
  final hasMoreTopOffice = false.obs;
  final scrollTopOfficeController = ScrollController();

  Future<void> getTopRateOffice({bool firstPage = true}) async {
    if (firstPage) {
      pageTopOffice.value = 1;
      hasMoreTopOffice.value = true;
    }
    if (!hasMoreTopOffice.value) {
      loadingTopOfficeState.value = LoadingState.doneWithNoData;
      return;
    }
    loadingTopOfficeState.value = LoadingState.loading;
    await Future.delayed(const Duration(seconds: 3));
    final response = await officeRepo.getTopRateOffice(
      perPage: perPage,
      page: pageTopOffice.value,
    );
    if (!response.success) {
      loadingTopOfficeState.value = LoadingState.hasError;
      hasMoreTopOffice.value = false;
      CustomToasts(
        message: response.getErrorMessage(),
        type: CustomToastType.error,
      ).show();
      return;
    }
    hasMoreTopOffice.value = false;
    firstPage
        ? topOfficeList.value = response.data?.data ?? []
        : topOfficeList.addAll(response.data!.data);
    log(topOfficeList.length.toString());
    log(response.data!.data.toString());
    hasMoreTopOffice.value = topOfficeList.length < response.data!.totalItems;
    loadingTopOfficeState.value =
        firstPage && topOfficeList.isEmpty
            ? LoadingState.doneWithNoData
            : LoadingState.doneWithData;
    if (hasMoreTopOffice.value) {
      pageTopOffice.value++;
    }
  }

  //?=================

  //? Get Top Service

  final loadingTopServiceState = LoadingState.loading.obs;
  final topServiceList = <ServiceDto>[].obs;
  final pageTopService = 1.obs;
  final hasMoreTopService = false.obs;
  final scrollTopServiceController = ScrollController();

  Future<void> getTopRateService({bool firstPage = true}) async {
    if (firstPage) {
      pageTopService.value = 1;
      hasMoreTopService.value = true;
    }
    if (!hasMoreTopService.value) {
      loadingTopServiceState.value = LoadingState.doneWithNoData;
      return;
    }
    loadingTopServiceState.value = LoadingState.loading;
    await Future.delayed(const Duration(seconds: 3));
    final response = await serviceRepo.getTopRateService(
      perPage: perPage,
      page: pageTopService.value,
    );
    if (!response.success) {
      loadingTopServiceState.value = LoadingState.hasError;
      hasMoreTopService.value = false;
      CustomToasts(
        message: response.getErrorMessage(),
        type: CustomToastType.error,
      ).show();
      return;
    }
    hasMoreTopService.value = false;
    firstPage
        ? topServiceList.value = response.data?.data ?? []
        : topServiceList.addAll(response.data!.data);
    log(topServiceList.length.toString());
    log(response.data!.data.toString());
    hasMoreTopService.value = topServiceList.length < response.data!.totalItems;
    loadingTopServiceState.value =
        firstPage && topServiceList.isEmpty
            ? LoadingState.doneWithNoData
            : LoadingState.doneWithData;
    if (hasMoreTopService.value) {
      pageTopService.value++;
    }
  }

  //?=================
}
