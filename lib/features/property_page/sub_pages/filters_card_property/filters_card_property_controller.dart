import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/widgets/custom_toasts.dart';
import 'package:property_ms/data/dto/property_dto.dart';
import 'package:property_ms/data/dto/property_search_filter_dto.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/data/repos/property_repositories.dart';

class FiltersCardPropertyController extends GetxController {
  final PropertyRepositories propertyRepo = Get.find<PropertyRepositories>();
  final PropertySearchFilterDto filters = PropertySearchFilterDto.fromJson(
    Get.arguments,
  );
  @override
  void onInit() {
    super.onInit();
    initScrollControllers();
    getAllProperty();
  }

  Future<void> refreshPage() async {
    allPropertList.clear();
    pageAllPropert.value = 1;
    hasMoreAllPropert.value = true;
    await getAllProperty();
  }

  void initScrollControllers() {
    scrollAllPropertController.addListener(() {
      if (scrollAllPropertController.position.maxScrollExtent ==
          scrollAllPropertController.offset) {
        getAllProperty(firstPage: false);
      }
    });
  }

  //? Get All Property Filters Pro

  final loadingAllPropertState = LoadingState.loading.obs;
  final allPropertList = <PropertyDto>[].obs;
  final pageAllPropert = 1.obs;
  final perPage = 5;
  final hasMoreAllPropert = false.obs;
  final scrollAllPropertController = ScrollController();
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

    final response = await propertyRepo.getPropertyFiltersPro(
      items: 5,
      page: pageAllPropert.value,
      model: filters,
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
}
