import 'dart:developer';

import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/data/enums/syrian_governorate.dart';
import 'package:property_ms/features/offices_page/widgets/filter_pro_office.dart';
import 'package:property_ms/features/widgets/office_card.dart';
import 'package:property_ms/features/widgets/question_bottum_sheets/question_type_widget.dart';

class OfficesController extends GetxController {
  final sliderIndex = 1.obs;
  RxInt selectedFilterIndex = 0.obs;
  RxBool isFiltterShow = false.obs;
  RxInt selectedIndexRateFilter = 3.obs;
  final adsSliderImages =
      <String>[
        "https://cdn.create.vista.com/downloads/61354a3a-e21b-430a-b271-b7c7a0197718_1024.jpeg",
        "https://assets.onepropertee.com/720x540/listing_images/285930354-345961094308908-6834786337806892984-n.jDQ7eZZK5ADBSnuNR.jpg",
        "https://img.freepik.com/free-psd/summer-sales-banner-template-with-colorful-triangular-shapes_23-2148151183.jpg",
        "https://img.freepik.com/free-vector/online-shopping-landing-page_23-2148789076.jpg?semt=ais_hybrid&w=740",
      ].obs;
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

  final topOffices = [
    OfficeCardModel(
      title: "مكتب ابو سمير",
      type: "سياحي",
      location: 'دمشق القديمة',
      rate: 4.5,
      image: Assets.images.propertyImage,
    ),
    OfficeCardModel(
      title: "مكتب الاحتراف",
      type: "سياحي",
      location: 'دمشق القديمة',
      rate: 4.5,
      image: Assets.images.propertyImage,
    ),
    OfficeCardModel(
      title: "مكتب التميز",
      type: "سياحي",
      location: 'دمشق القديمة',
      rate: 4.5,
      image: Assets.images.propertyImage,
    ),
    OfficeCardModel(
      title: "مكتب الحوت",
      type: "سياحي",
      location: 'دمشق القديمة',
      rate: 4.5,
      image: Assets.images.propertyImage,
    ),
  ];

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
    FilterProOffice.showAnswer();
  }
}
