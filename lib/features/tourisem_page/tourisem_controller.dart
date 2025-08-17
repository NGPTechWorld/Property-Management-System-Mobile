import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/data/dto/tourism_dto.dart';
import 'package:property_ms/data/enums/property_furnishing_type.dart';
import 'package:property_ms/data/enums/property_ownership_type.dart';
import 'package:property_ms/data/enums/property_post_tag.dart';
import 'package:property_ms/data/enums/syrian_governorate.dart';
import 'package:property_ms/data/enums/tourism_pace_water_status.dart';
import 'package:property_ms/data/enums/tourism_place_electricity_status.dart';
import 'package:property_ms/data/enums/tourism_place_extras.dart';
import 'package:property_ms/data/enums/tourism_place_pool_status.dart';
import 'package:property_ms/features/tourisem_page/widgets/filter_pro_tourisem.dart';
import 'package:property_ms/features/widgets/card_filter.dart';
import 'package:property_ms/features/widgets/question_bottum_sheets/question_type_widget.dart';
import 'package:property_ms/features/widgets/tourisem_card.dart';

class TourisemController extends GetxController {
  final searchController = TextEditingController();
  final sliderIndex = 0.obs;
  final selectedFilterIndex = 0.obs;
  final selectedSumFilterIndex = 0.obs;

  final minPrice = 0.0.obs;
  final maxPrice = 500.0.obs;
  final selectedQuestionPT = 0.obs;

  final List<CardFilterModel> cardFilter = [
    CardFilterModel(title: "الكل"),
    CardFilterModel(title: "الأحدث"),
    CardFilterModel(title: "السعر الأعلى"),
    CardFilterModel(title: "السعر الأقل"),
    CardFilterModel(title: "المساحة الأكبر"),
    CardFilterModel(title: "المساحة الأصغر"),
  ];

  final tourisemSlider = [
    TourisemCardModel(
      title: 'شقة 100 م²',
      location: 'دمشق, شعلان',
      priceUnit: 'شهري',
      rate: 4.5,
      price: 2500,
      image: Assets.images.property,
    ),
    TourisemCardModel(
      title: 'شقة 100 م²',
      location: 'دمشق, شعلان',
      priceUnit: 'شهري',
      rate: 4.5,
      price: 2500,
      image: Assets.images.property,
    ),
    TourisemCardModel(
      title: 'شقة 100 م²',
      location: 'دمشق, شعلان',
      priceUnit: 'شهري',
      rate: 4.5,
      price: 2500,
      image: Assets.images.property,
    ),
  ];
  final allTourisems = [
    TourismDto(
      postImage: '',
      rate: 2,
      type: '',
      listingType: '',
      tourismId: 1,
      postTitle: "مزرعة",
      location: "ريف دمشق, الزبداني",
      area: 200,
      price: 1500,
      isFavorite: false,
    ),
  ];

  List<QuestionModel> questionsFilters = [
    QuestionModel(
      title: "المحافظة",
      type: QuestionType.oneSelect,
      answers:
          SyrianGovernorate.values
              .asMap()
              .entries
              .map((e) => ValueAnser(id: e.key + 1, name: e.value.value))
              .toList(),
      id: 1,
    ),
    QuestionModel(
      title: "المنطقة",
      type: QuestionType.oneSelect,
      answers: [],
      id: 2,
    ),
    QuestionModel(
      title: "كلمات المفتاحية",
      type: QuestionType.oneSelect,
      answers:
          PropertyPostTag.values
              .asMap()
              .entries
              .map((e) => ValueAnser(id: e.key + 1, name: e.value.value))
              .toList(),
      id: 3,
    ),
    QuestionModel(
      title: "نوع الملكية",
      type: QuestionType.oneSelect,
      answers:
          PropertyOwnershipType.values
              .asMap()
              .entries
              .map((e) => ValueAnser(id: e.key + 1, name: e.value.value))
              .toList(),
      id: 4,
    ),
    QuestionModel(
      title: "المساحة",
      type: QuestionType.oneSelect,
      answers: [
        ValueAnser(id: 1, name: "50 م²"),
        ValueAnser(id: 2, name: "75 م²"),
        ValueAnser(id: 3, name: "100 م²"),
        ValueAnser(id: 4, name: "120 م²"),
        ValueAnser(id: 5, name: "150 م²"),
        ValueAnser(id: 6, name: "180 م²"),
        ValueAnser(id: 7, name: "200 م²"),
        ValueAnser(id: 8, name: "250 م²"),
        ValueAnser(id: 9, name: "300 م²"),
        ValueAnser(id: 10, name: "350 م²"),
        ValueAnser(id: 11, name: "400 م²"),
        ValueAnser(id: 12, name: "450 م²"),
        ValueAnser(id: 13, name: "500 م²"),
        ValueAnser(id: 14, name: "600 م²"),
        ValueAnser(id: 15, name: "700 م²"),
        ValueAnser(id: 16, name: "800 م²"),
        ValueAnser(id: 17, name: "900 م²"),
        ValueAnser(id: 18, name: "1000 م²"),
        ValueAnser(id: 19, name: "1200 م²"),
        ValueAnser(id: 20, name: "1500 م²"),
      ],
      id: 5,
    ),
    QuestionModel(
      title: "الكهرباء",
      type: QuestionType.oneSelect,
      answers:
          TourismPlaceElectricityStatus.values
              .asMap()
              .entries
              .map((e) => ValueAnser(id: e.key + 1, name: e.value.value))
              .toList(),
      id: 6,
    ),
    QuestionModel(
      title: "المياه",
      type: QuestionType.oneSelect,
      answers:
          TourismPlaceWaterStatus.values
              .asMap()
              .entries
              .map((e) => ValueAnser(id: e.key + 1, name: e.value.value))
              .toList(),
      id: 7,
    ),
    QuestionModel(
      title: "الفرش",
      type: QuestionType.oneSelect,
      answers:
          PropertyFurnishingType.values
              .asMap()
              .entries
              .map((e) => ValueAnser(id: e.key + 1, name: e.value.value))
              .toList(),
      id: 8,
    ),
    QuestionModel(
      title: "المسبح",
      type: QuestionType.oneSelect,
      answers:
          TourismPlacePoolStatus.values
              .asMap()
              .entries
              .map((e) => ValueAnser(id: e.key + 1, name: e.value.value))
              .toList(),
      id: 9,
    ),
    QuestionModel(
      title: "عدد الغرف",
      type: QuestionType.oneSelect,
      answers: List.generate(
        20,
        (index) => ValueAnser(id: index + 1, name: (index + 1).toString()),
      ),
      id: 10,
    ),
    QuestionModel(
      title: "عدد الغرف",
      type: QuestionType.oneSelect,
      answers: List.generate(
        20,
        (index) => ValueAnser(id: index + 1, name: (index + 1).toString()),
      ),
      id: 11,
    ),
    QuestionModel(
      title: "عدد غرف النوم",
      type: QuestionType.oneSelect,
      answers: List.generate(
        10,
        (index) => ValueAnser(id: index + 1, name: (index + 1).toString()),
      ),
      id: 12,
    ),
    QuestionModel(
      title: "عدد غرف المعيشة",
      type: QuestionType.oneSelect,
      answers: List.generate(
        10,
        (index) => ValueAnser(id: index + 1, name: (index + 1).toString()),
      ),
      id: 13,
    ),
    QuestionModel(
      title: "عدد المطابخ",
      type: QuestionType.oneSelect,
      answers: List.generate(
        10,
        (index) => ValueAnser(id: index + 1, name: (index + 1).toString()),
      ),
      id: 14,
    ),
    QuestionModel(
      title: "عدد الحمامات",
      type: QuestionType.oneSelect,
      answers: List.generate(
        10,
        (index) => ValueAnser(id: index + 1, name: (index + 1).toString()),
      ),
      id: 15,
    ),
  ];
  QuestionModel quastionExtra = QuestionModel(
    title: "المرفقات الإضافية",
    type: QuestionType.multiSelect,
    answers:
        TourismPlaceExtras.values
            .asMap()
            .entries
            .map((e) => ValueAnser(id: e.key + 1, name: e.value.value))
            .toList(),
    id: 4,
  );
  selectAnwser(QuestionModel q) {}
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
            .map((e) => ValueAnser(id: e.value.id, name: e.value.name))
            .toList();
    questionsFilters[1].controller.text = "";
    questionsFilters[1].selectedIndex.value = null;
    questionsFilters[1].answers.clear();
    log(questionsFilters[1].answers.toString());
    log(locationAnswers.toString());
    questionsFilters[1].answers.addAll(locationAnswers);
  }

  void selectFilter(int index) {
    selectedFilterIndex.value = index;
  }

  openFilterPagePro() {
    for (var q in questionsFilters) {
      q.controller.text = "";
      q.selectedIndex.value = null;
      q.selectedIndices.value = [];
    }
    FilterProTourisem.showAnswer(this);
  }
}
