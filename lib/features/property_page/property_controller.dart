import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/Routes/app_routes.dart';
import 'package:property_ms/core/services/cache/cache_keys.dart';
import 'package:property_ms/core/services/cache/cache_service.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/widgets/custom_toasts.dart';
import 'package:property_ms/data/dto/property_dto.dart';
import 'package:property_ms/data/dto/property_search_filter_dto.dart';

import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/data/enums/property_direction.dart';
import 'package:property_ms/data/enums/property_furnishing_type.dart';
import 'package:property_ms/data/enums/property_ownership_type.dart';
import 'package:property_ms/data/enums/property_post_tag.dart';
import 'package:property_ms/data/enums/syrian_governorate.dart';
import 'package:property_ms/data/models/app_response.dart';
import 'package:property_ms/data/models/paginated_model.dart';
import 'package:property_ms/data/repos/property_repositories.dart';
import 'package:property_ms/features/main_page/main_controller.dart';
import 'package:property_ms/features/property_page/widgets/filter_pro_property.dart';
import 'package:property_ms/features/widgets/card_filter.dart';
import 'package:property_ms/features/widgets/question_bottum_sheets/question_type_widget.dart';

class PropertyController extends GetxController {
  final PropertyRepositories propertyRepo = Get.find<PropertyRepositories>();
  final CacheService cacheService = Get.find<CacheService>();
  final mainController = Get.find<MainController>();
  final searchController = TextEditingController();
  final sliderIndex = 0.obs;

  //!     Filters
  final selectedFilterIndex = 0.obs;
  final selectedSumFilterIndex = 0.obs;
  final minPrice = 0.0.obs;
  final maxPrice = 0.0.obs;
  final selectedQuestionPT = 0.obs;

  final List<CardFilterModel> cardFilter = [
    CardFilterModel(title: "الكل"),
    CardFilterModel(title: "بيع", icon: Assets.icons.property),
    CardFilterModel(title: "إيجار", icon: Assets.icons.property),
    CardFilterModel(title: "الأحدث"),
    CardFilterModel(title: "السعر الأعلى"),
    CardFilterModel(title: "السعر الأقل"),
    CardFilterModel(title: "المساحة الأكبر"),
    CardFilterModel(title: "المساحة الأصغر"),
  ];

  List<QuestionModel> questionsFilters = [
    QuestionModel(
      title: "المحافظة",
      type: QuestionType.oneSelect,
      answers:
          SyrianGovernorate.values
              .asMap()
              .entries
              .map((e) => ValueAnser(id: e.value.id, name: e.value.value))
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
      title: "الفرش",
      type: QuestionType.oneSelect,
      answers:
          PropertyFurnishingType.values
              .asMap()
              .entries
              .map((e) => ValueAnser(id: e.key + 1, name: e.value.value))
              .toList(),
      id: 5,
    ),
    QuestionModel(
      title: "الجهة",
      type: QuestionType.oneSelect,
      answers:
          PropertyDirection.values
              .asMap()
              .entries
              .map((e) => ValueAnser(id: e.key + 1, name: e.value.value))
              .toList(),
      id: 6,
    ),
    QuestionModel(
      title: "الطابق",
      type: QuestionType.oneSelect,
      answers: List.generate(
        20,
        (index) => ValueAnser(id: index + 1, name: (index + 1).toString()),
      ),
      id: 7,
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
      id: 7,
    ),

    QuestionModel(
      title: "عدد الغرف",
      type: QuestionType.oneSelect,
      answers: List.generate(
        20,
        (index) => ValueAnser(id: index + 1, name: (index + 1).toString()),
      ),
      id: 8,
    ),
    QuestionModel(
      title: "عدد غرف النوم",
      type: QuestionType.oneSelect,
      answers: List.generate(
        10,
        (index) => ValueAnser(id: index + 1, name: (index + 1).toString()),
      ),
      id: 9,
    ),
    QuestionModel(
      title: "عدد غرف المعيشة",
      type: QuestionType.oneSelect,
      answers: List.generate(
        10,
        (index) => ValueAnser(id: index + 1, name: (index + 1).toString()),
      ),
      id: 10,
    ),
    QuestionModel(
      title: "عدد المطابخ",
      type: QuestionType.oneSelect,
      answers: List.generate(
        10,
        (index) => ValueAnser(id: index + 1, name: (index + 1).toString()),
      ),
      id: 11,
    ),
    QuestionModel(
      title: "عدد الحمامات",
      type: QuestionType.oneSelect,
      answers: List.generate(
        10,
        (index) => ValueAnser(id: index + 1, name: (index + 1).toString()),
      ),
      id: 12,
    ),
  ];

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
    maxPrice.value = minPrice.value = 0;
    if (cacheService.getData(key: kUserToken) != null) {
      FilterProProperty.showAnswer(this);
    } else {
      Get.offAllNamed(AppRoutes.loginRoute);
    }
  }

  //! ===============================================

  @override
  void onInit() {
    super.onInit();
    initScrollControllers();
    searchController.addListener(_onSearchChanged);
    getAllProperty();
    getPropertyPromoted();
  }

  @override
  void onClose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    super.onClose();
  }

  Future<void> refreshPage() async {
    allPropertList.clear();
    pageAllPropert.value = 1;
    hasMoreAllPropert.value = true;
    await getAllProperty();
    topPropertList.clear();
    pageTopPropert.value = 1;
    hasMoreTopPropert.value = true;
    await getPropertyPromoted();
  }

  void initScrollControllers() {
    scrollAllPropertController.addListener(() {
      if (scrollAllPropertController.position.maxScrollExtent ==
          scrollAllPropertController.offset) {
        getAllProperty(firstPage: false);
      }
    });
    scrollTopPropertController.addListener(() {
      if (scrollTopPropertController.position.maxScrollExtent ==
          scrollTopPropertController.offset) {
        getPropertyPromoted(firstPage: false);
      }
    });
  }

  //? Get All Property Filters

  final loadingAllPropertState = LoadingState.loading.obs;
  final allPropertList = <PropertyDto>[].obs;
  final pageAllPropert = 1.obs;
  final perPage = 5;
  final hasMoreAllPropert = false.obs;
  final scrollAllPropertController = ScrollController();
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
    final filters = getSelectedFilters();
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
        listingType: filters["listing_type"] ?? "",
        orderByArea: filters["orderByArea"] ?? "",
        orderByPrice: filters["orderByPrice"] ?? "",
        orderByDate: filters["orderByDate"] ?? "",
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

  Map<String, dynamic> getSelectedFilters() {
    final filters = <String, dynamic>{};

    final filterTitle = cardFilter[selectedFilterIndex.value].title;
    if (filterTitle == "بيع") {
      filters["listing_type"] = "بيع";
    } else if (filterTitle == "إيجار") {
      filters["listing_type"] = "أجار";
    } else if (filterTitle == "السعر الأعلى") {
      filters["orderByPrice"] = "DESC";
    } else if (filterTitle == "السعر الأقل") {
      filters["orderByPrice"] = "ASC";
    } else if (filterTitle == "المساحة الأكبر") {
      filters["orderByArea"] = "DESC";
    } else if (filterTitle == "المساحة الأصغر") {
      filters["orderByArea"] = "ASC";
    } else if (filterTitle == "الأحدث") {
      filters["orderByDate"] = "DESC";
    }

    return filters;
  }

  //?=================

  //?   Search

  void _onSearchChanged() async {
    final text = searchController.text.trim();
    if (text.isEmpty || searchController.text == "") {
      isSearch.value = false;
      await refreshPage();
    } else {
      isSearch.value = true;
      await refreshPage();
    }
  }

  //?=================

  //?   init  Filter Pro
  PropertySearchFilterDto buildPropertyFilterDtoFromQuestions() {
    int getIntAnswer(int questionId) {
      final q = questionsFilters.firstWhereOrNull((e) => e.id == questionId);
      final index = q?.selectedIndex.value;
      return (index != null && q!.answers.length > index)
          ? int.parse(q.controller.text)
          : 0;
    }

    String getStringAnswer(int questionId) {
      final q = questionsFilters.firstWhereOrNull((e) => e.id == questionId);
      final index = q?.selectedIndex.value;
      return (index != null && q!.answers.length > index)
          ? q.controller.text
          : '';
    }

    final roomDetails = RoomDetailsDto(
      roomCount: getIntAnswer(8),
      bedroomCount: getIntAnswer(9),
      livingRoomCount: getIntAnswer(10),
      kitchenCount: getIntAnswer(11),
      bathroomCount: getIntAnswer(12),
    );

    return PropertySearchFilterDto(
      cityId: questionsFilters[0].selectedIndex.value ?? 0,
      regionId: questionsFilters[1].selectedIndex.value ?? 0,
      listingType:
          cardFilterTypeProp[selectedQuestionPT.value].title == "بيع"
              ? "بيع"
              : cardFilterTypeProp[selectedQuestionPT.value].title == "إيجار"
              ? "أجار"
              : "",
      minPrice: minPrice.value.toInt(),
      maxPrice: maxPrice.value.toInt(),
      minArea: 0,
      maxArea: 0,
      status: 'متوفر',
      hasFurniture: getStringAnswer(5),
      direction: getStringAnswer(6),
      ownershipType: getStringAnswer(4),
      floorNumber: getIntAnswer(7),
      tag: getStringAnswer(3),
      roomDetails: roomDetails,
    );
  }

  //?=================

  //? Get Top Property

  final loadingTopPropertState = LoadingState.loading.obs;
  final topPropertList = <PropertyDto>[].obs;
  final pageTopPropert = 1.obs;
  final hasMoreTopPropert = false.obs;
  final scrollTopPropertController = ScrollController();

  Future<void> getPropertyPromoted({bool firstPage = true}) async {
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
    final response = await propertyRepo.getPropertyPromoted(
      items: perPage,
      page: pageTopPropert.value,
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
}
