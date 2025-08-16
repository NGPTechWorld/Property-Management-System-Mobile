import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/widgets/custom_toasts.dart';
import 'package:property_ms/data/dto/office_dto.dart';
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
  }

  @override
  void onClose() {
    // Tabbar
    tabController.dispose();
    super.onClose();
  }

  Future<void> refreshOfficeProfile() async {
    getOffices();
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

  RxList filteredProperties = [].obs;

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
}
