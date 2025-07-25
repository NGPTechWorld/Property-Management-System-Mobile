import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/widgets/custom_toasts.dart';
import 'package:property_ms/data/dto/service_dto.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/data/enums/property_service_provider_type_enum.dart';
import 'package:property_ms/data/enums/syrian_governorate.dart';
import 'package:property_ms/data/repos/services_repositories.dart';
import 'package:property_ms/features/services_page/widgets/filter_pro_service.dart';
import 'package:property_ms/features/widgets/card_filter.dart';
import 'package:property_ms/features/widgets/question_bottum_sheets/question_type_widget.dart';

class ServicesController extends GetxController {
  final ServicesRepositories serviceRepo = Get.find<ServicesRepositories>();
  final searchController = TextEditingController();
  final allServices = <ServiceDto>[].obs;

  //!   Fillters
  RxInt selectedFilterIndex = 0.obs;
  RxInt selectedIndexRateFilter = 3.obs;
  RxBool isFiltterShow = false.obs;
  List<CardFilterModel> cardFiltter =
      PropertyServiceProviderType.values
          .map((e) => CardFilterModel(title: e.value))
          .toList();

  final govermentQuestion = QuestionModel(
    title: "المحافظة",
    type: QuestionType.oneSelect,
    answers:
        SyrianGovernorate.values
            .asMap()
            .entries
            .map((e) => ValueAnser(id: e.key + 1, name: e.value.value))
            .toList(),
    id: 1,
  );
  final locationQuestion = QuestionModel(
    title: "المنطقة",
    type: QuestionType.oneSelect,
    answers: [],
    id: 2,
  );

  void onGovernorateSelected(String selectedGovernorateName) {
    final selectedGovernorate = SyrianGovernorate.values.firstWhere(
      (e) => e.value == selectedGovernorateName,
      orElse: () => SyrianGovernorate.damascus,
    );

    final areas = syrianGovernoratesAreas[selectedGovernorate] ?? [];

    final locationAnswers =
        areas
            .asMap()
            .entries
            .map((e) => ValueAnser(id: e.key + 1, name: e.value))
            .toList();
    locationQuestion.controller.text = "";
    locationQuestion.selectedIndex.value = null;
    locationQuestion.answers.clear();
    log(locationQuestion.answers.toString());
    log(locationAnswers.toString());
    locationQuestion.answers.addAll(locationAnswers);
  }

  void selectFilter(int index) {
    selectedFilterIndex.value = index;
  }

  openFilterPagePro() {
    locationQuestion.controller.text = "";
    locationQuestion.selectedIndex.value = null;
    locationQuestion.selectedIndices.value = [];
    govermentQuestion.controller.text = "";
    govermentQuestion.selectedIndex.value = null;
    govermentQuestion.selectedIndices.value = [];
    FilterProService.showAnswer();
  }
  //!=====================

  @override
  void onInit() {
    super.onInit();
    initScrollControllers();
    getTopRateService();
  }

  Future<void> refreshPage() async {
    topServiceList.clear();
    pageTopService.value = 1;
    hasMoreTopService.value = true;
    await getTopRateService();
  }

  void initScrollControllers() {
    scrollTopServiceController.addListener(() {
      if (scrollTopServiceController.position.maxScrollExtent ==
          scrollTopServiceController.offset) {
        getTopRateService(firstPage: false);
      }
    });
  }

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
      perPage: 5,
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
