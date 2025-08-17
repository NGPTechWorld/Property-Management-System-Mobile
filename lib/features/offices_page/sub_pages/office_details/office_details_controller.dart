import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/widgets/custom_toasts.dart';
import 'package:property_ms/data/dto/office_dto.dart';
import 'package:property_ms/data/dto/property_dto.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/data/models/office_model.dart';
import 'package:property_ms/data/repos/offices_repositories.dart';

class OfficeDetailsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final OfficeDto officeCard = Get.arguments as OfficeDto;
  final OfficesRepositories officeRepo = Get.find<OfficesRepositories>();
  final loadingState = LoadingState.idle.obs;
  RxDouble rating = 0.0.obs;
  RxDouble myRating = 4.0.obs;
  OfficeModel? officeModel;

  @override
  void onInit() {
    // rating.value = double.tryParse(office.rate.toString()) ?? 0.0;
    // Tabbar
    tabController = TabController(length: tabs.length, vsync: this);
    super.onInit();
    getOffices();
    initScrollControllers();
    getProperty(firstPage: true);
  }

  @override
  void onClose() {
    // Tabbar
    tabController.dispose();
    scrollAllPropertController.dispose();
    super.onClose();
  }

  void initScrollControllers() {
    scrollAllPropertController.addListener(() {
      if (scrollAllPropertController.position.maxScrollExtent ==
          scrollAllPropertController.offset) {
        getProperty(firstPage: false);
      }
    });
  }

  Future<void> refreshOfficeProfile() async {
    getOffices();
  }

  Future<void> refreshOfficeProprty() async {
    allPropertList.clear();
    pageAllPropert.value = 1;
    hasMoreAllPropert.value = true;
    getProperty();
  }

  // filter
  RxInt selectedFilterIndex = 0.obs;
  RxBool isFiltterShow = false.obs;

  void selectFilter(int index) {
    selectedFilterIndex.value = index;
    updateFilteredProperties();
  }

  //?    Rating
  void updateRating(double newRating) async {
    myRating.value = newRating;
    await postOfficeRate();
  }

  Future<void> postOfficeRate() async {
    Future.delayed(const Duration(seconds: 3));
    final response = await officeRepo.postOfficeRate(
      id: officeCard.id,
      rate: myRating.value.toString(),
    );

    if (!response.success) {
      CustomToasts(
        message: response.getErrorMessage(),
        type: CustomToastType.error,
      ).show();
      return;
    }
    CustomToasts(
      message: response.successMessage!,
      type: CustomToastType.success,
    ).show();
  }

  //? ====================
  //! Tabbar
  late TabController tabController;

  final tabs = ["جميع العقارات", "معلومات الحساب"];

  //! list obs for filter

  void updateFilteredProperties() {
    if (selectedFilterIndex.value == 0) {
      // Show all
    } else if (selectedFilterIndex.value == 1) {
    } else if (selectedFilterIndex.value == 2) {}
  }

  Future<void> getOffices() async {
    if (loadingState.value == LoadingState.loading) return;
    loadingState.value = LoadingState.loading;
    Future.delayed(const Duration(seconds: 3));
    final response = await officeRepo.getOffice(id: officeCard.id);

    if (!response.success) {
      loadingState.value = LoadingState.hasError;
      CustomToasts(
        message: response.getErrorMessage(),
        type: CustomToastType.error,
      ).show();
      return;
    }
    officeModel = response.data;
    rating.value = officeModel!.rate;
    loadingState.value = LoadingState.doneWithData;
  }

  //? Get All Property

  final loadingAllPropertState = LoadingState.loading.obs;
  final allPropertList = <PropertyDto>[].obs;
  final pageAllPropert = 1.obs;
  final hasMoreAllPropert = false.obs;
  final scrollAllPropertController = ScrollController();

  Future<void> getProperty({bool firstPage = true}) async {
    if (firstPage) {
      pageAllPropert.value = 1;
      hasMoreAllPropert.value = true;
    }
    if (!hasMoreAllPropert.value) {
      loadingAllPropertState.value = LoadingState.doneWithNoData;
      return;
    }
    loadingAllPropertState.value = LoadingState.loading;
    await Future.delayed(const Duration(seconds: 1));
    final response = await officeRepo.getOfficeProperty(
      perPage: 5,
      page: pageAllPropert.value,
      id: officeCard.id,
    );
    if (!response.success) {
      loadingAllPropertState.value = LoadingState.hasError;
      hasMoreAllPropert.value = false;
      CustomToasts(
        message: response.getErrorMessage(),
        type: CustomToastType.error,
      ).show();
      return;
    }
    hasMoreAllPropert.value = false;
    firstPage
        ? allPropertList.value = response.data?.data ?? []
        : allPropertList.addAll(response.data!.data);
    log(allPropertList.length.toString());
    log(response.data!.data.toString());
    hasMoreAllPropert.value = allPropertList.length < response.data!.totalItems;
    loadingAllPropertState.value =
        firstPage && allPropertList.isEmpty
            ? LoadingState.doneWithNoData
            : LoadingState.doneWithData;
    if (hasMoreAllPropert.value) {
      pageAllPropert.value++;
    }
  }

  //?=================
}
