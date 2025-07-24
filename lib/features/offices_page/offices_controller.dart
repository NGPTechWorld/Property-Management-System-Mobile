import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/widgets/custom_toasts.dart';
import 'package:property_ms/data/dto/office_dto.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/data/enums/syrian_governorate.dart';
import 'package:property_ms/data/repos/offices_repositories.dart';
import 'package:property_ms/features/offices_page/widgets/filter_pro_office.dart';
import 'package:property_ms/features/widgets/question_bottum_sheets/question_type_widget.dart';

class OfficesController extends GetxController {
  final OfficesRepositories officeRepo = Get.find<OfficesRepositories>();

  //? Slider

  final sliderIndex = 1.obs;

  final adsSliderImages =
      <String>[
        "https://cdn.create.vista.com/downloads/61354a3a-e21b-430a-b271-b7c7a0197718_1024.jpeg",
        "https://assets.onepropertee.com/720x540/listing_images/285930354-345961094308908-6834786337806892984-n.jDQ7eZZK5ADBSnuNR.jpg",
        "https://img.freepik.com/free-psd/summer-sales-banner-template-with-colorful-triangular-shapes_23-2148151183.jpg",
        "https://img.freepik.com/free-vector/online-shopping-landing-page_23-2148789076.jpg?semt=ais_hybrid&w=740",
      ].obs;
  //?======================================

  //!  Fillters

  RxInt selectedFilterIndex = 0.obs;
  RxBool isFiltterShow = false.obs;
  RxInt selectedIndexRateFilter = 3.obs;
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
  openFilterPagePro() {
    locationQuestion.controller.text = "";
    locationQuestion.selectedIndex.value = null;
    locationQuestion.selectedIndices.value = [];
    govermentQuestion.controller.text = "";
    govermentQuestion.selectedIndex.value = null;
    govermentQuestion.selectedIndices.value = [];
    FilterProOffice.showAnswer();
  }

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

  //!======================================

  final officesList = [];

  @override
  void onInit() {
    super.onInit();
    initScrollControllers();
    getTopRateOffice();
  }

  Future<void> refreshPage() async {
    topOfficeList.clear();
    pageTopOffice.value = 1;
    hasMoreTopOffice.value = true;
    await getTopRateOffice();
  }

  void initScrollControllers() {
    scrollTopOfficeController.addListener(() {
      if (scrollTopOfficeController.position.maxScrollExtent ==
          scrollTopOfficeController.offset) {
        getTopRateOffice(firstPage: false);
      }
    });
  }
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
      perPage: 5,
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
}
