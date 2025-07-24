import 'dart:developer';

import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/data/dto/service_dto.dart';
import 'package:property_ms/data/entity/services_card_model.dart';
import 'package:property_ms/data/enums/property_service_provider_type_enum.dart';
import 'package:property_ms/data/enums/syrian_governorate.dart';
import 'package:property_ms/features/services_page/widgets/filter_pro_service.dart';
import 'package:property_ms/features/widgets/card_filter.dart';
import 'package:property_ms/features/widgets/question_bottum_sheets/question_type_widget.dart';

class ServicesController extends GetxController {
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

  final topServices = <ServiceDto>[].obs;
  final allServices = <ServiceDto>[].obs;

  void selectFilter(int index) {
    selectedFilterIndex.value = index;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
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
}
