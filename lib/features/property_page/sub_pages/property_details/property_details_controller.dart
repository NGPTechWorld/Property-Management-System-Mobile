import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:property_ms/core/utils/widgets/custom_toasts.dart';
import 'package:property_ms/data/dto/property_dto.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/data/models/app_response.dart';
import 'package:property_ms/data/models/paginated_model.dart';
import 'package:property_ms/data/models/property_model.dart';
import 'package:property_ms/data/repos/property_repositories.dart';
import 'package:property_ms/features/property_page/sub_pages/property_details/widget/select_property_bottom_sheet.dart';

class PropertyDetailsController extends GetxController {
  final rating = 4.0.obs;
  final myRating = 4.0.obs;

  final PropertyRepositories propertyRepo = Get.find<PropertyRepositories>();
  final loadingState = LoadingState.idle.obs;
  final RxInt sliderIndex = 0.obs;
  final isLoadingImages = true.obs;
  final int id = int.parse(Get.parameters['id']!);
  final ScrollController scrollController = ScrollController();

  // late PropertyDetailsModel propertyDetails;

  PropertyModel? propertyDetails;

  @override
  void onInit() async {
    super.onInit();
    initScrollControllers();
    await getProperty();
    await getPropertyRelated();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void initScrollControllers() {
    scrollTopPropertController.addListener(() {
      if (scrollTopPropertController.position.maxScrollExtent ==
          scrollTopPropertController.offset) {
        getPropertyRelated(firstPage: false);
      }
    });
    scrollAllPropertController.addListener(() {
      if (scrollAllPropertController.position.maxScrollExtent ==
          scrollAllPropertController.offset) {
        getAllProperty(firstPage: false);
      }
    });
  }

  Future<void> getProperty() async {
    if (loadingState.value == LoadingState.loading) return;
    loadingState.value = LoadingState.loading;
    Future.delayed(const Duration(seconds: 3));
    final response = await propertyRepo.getProperty(id: id);

    if (!response.success) {
      loadingState.value = LoadingState.hasError;
      CustomToasts(
        message: response.getErrorMessage(),
        type: CustomToastType.error,
      ).show();
      return;
    }
    propertyDetails = response.data;
    rating.value = propertyDetails!.avgRate;
    loadingState.value = LoadingState.doneWithData;
  }

  //? Get Top Property

  final loadingTopPropertState = LoadingState.loading.obs;
  final topPropertList = <PropertyDto>[].obs;
  final pageTopPropert = 1.obs;
  final hasMoreTopPropert = false.obs;
  final scrollTopPropertController = ScrollController();

  Future<void> getPropertyRelated({bool firstPage = true}) async {
    if (firstPage) {
      pageTopPropert.value = 1;
      hasMoreTopPropert.value = true;
    }
    if (!hasMoreTopPropert.value) {
      loadingTopPropertState.value = LoadingState.doneWithNoData;
      return;
    }
    loadingTopPropertState.value = LoadingState.loading;
    await Future.delayed(const Duration(seconds: 1));
    final response = await propertyRepo.getPropertyRelated(id: id);
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

  //!    Compare Property

  void openSelectPropertyBottomSheet() async {
    await getAllProperty();
    SelectPropertyBottomSheet.showAnswer();
  }
  //? Get All Property Filters

  final loadingAllPropertState = LoadingState.loading.obs;
  final allPropertList = <PropertyDto>[].obs;
  final pageAllPropert = 1.obs;
  final perPage = 5;
  final hasMoreAllPropert = false.obs;
  final scrollAllPropertController = ScrollController();
  final searchController = TextEditingController();

  RxBool isSearch = false.obs;
  Future<void> getAllProperty({bool firstPage = true}) async {
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
    AppResponse<PaginatedModel<PropertyDto>> response;
    if (isSearch.value && searchController.text != "") {
      response = await propertyRepo.getPropertySerach(
        items: 7,
        page: pageAllPropert.value,
        title: searchController.text,
      );
    } else {
      response = await propertyRepo.getPropertyFilters(
        items: 7,
        page: pageAllPropert.value,
        regionId: 0,
        cityId: 0,
        tag: "",
        listingType: propertyDetails!.listingType,
        orderByArea: "",
        orderByPrice: "",
        orderByDate: "",
      );
    }

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

  //!====================

  //?    Rating
  void updateRating(double newRating) async {
    myRating.value = newRating;
    await postPropertyRate();
  }

  Future<void> postPropertyRate() async {
    Future.delayed(const Duration(seconds: 3));
    final response = await propertyRepo.postPropertyRate(
      id: propertyDetails!.propertyId,
      rate: myRating.value,
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
}
