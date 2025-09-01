import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/Routes/app_routes.dart';
import 'package:property_ms/core/services/cache/cache_keys.dart';
import 'package:property_ms/core/services/cache/cache_service.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/widgets/custom_toasts.dart';
import 'package:property_ms/data/dto/property_dto.dart';
import 'package:property_ms/data/dto/tourism_dto.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/data/enums/property_furnishing_type.dart';
import 'package:property_ms/data/enums/property_ownership_type.dart';
import 'package:property_ms/data/enums/property_post_tag.dart';
import 'package:property_ms/data/enums/syrian_governorate.dart';
import 'package:property_ms/data/enums/tourism_place_electricity_status.dart';
import 'package:property_ms/data/enums/tourism_place_extras.dart';
import 'package:property_ms/data/enums/tourism_place_pool_status.dart';
import 'package:property_ms/data/models/app_response.dart';
import 'package:property_ms/data/models/paginated_model.dart';
import 'package:property_ms/data/repos/property_repositories.dart';
import 'package:property_ms/data/repos/tourism_repositories.dart';
import 'package:property_ms/features/main_page/main_controller.dart';
import 'package:property_ms/features/tourisem_page/widgets/filter_pro_tourisem.dart';
import 'package:property_ms/features/widgets/card_filter.dart';
import 'package:property_ms/features/widgets/question_bottum_sheets/question_type_widget.dart';

class TourisemController extends GetxController {
  final TourismRepositories tourismRepo = Get.find<TourismRepositories>();
  final PropertyRepositories propertyRepo = Get.find<PropertyRepositories>();
  final mainController = Get.find<MainController>();
  final CacheService cacheService = Get.find<CacheService>();
  final searchController = TextEditingController();
  final sliderIndex = 0.obs;

  //! Filters
  final selectedFilterIndex = 0.obs;
  final selectedSumFilterIndex = 0.obs;
  final minPrice = 0.0.obs;
  final maxPrice = 300.0.obs;
  final selectedQuestionPT = 0.obs;

  final List<CardFilterModel> cardFilter = [
    CardFilterModel(title: "الكل"),
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
      FilterProTourisem.showAnswer(this);
    } else {
      Get.offAllNamed(AppRoutes.loginRoute);
    }
  }

  //! Pagination & Scroll
  final loadingAllTourismState = LoadingState.loading.obs;
  final allTourismList = <TourismDto>[].obs;
  final pageAllTourism = 1.obs;
  final perPage = 7;
  final hasMoreAllTourism = false.obs;
  final scrollAllTourismController = ScrollController();
  RxBool isSearch = false.obs;

  final tourisemSlider = [
    TourismDto(
      propertyId: 0,
      postImage:
          'https://www.allplan.com/fileadmin/_processed_/a/1/csm_iStock-1181593567_NEU-1_3aeee8b4a9.jpg',
      postTitle: 'شقة 140 م²',
      description: '',
      date: '',
      images: [],
      area: 0.0,
      location: 'دمشق, شعلان',
      price: 1500,
      listingType: 'أجار',
      type: 'سياحي',
      rate: 4,
      avgRate: 4,
      isFavorite: true,
    ),
    TourismDto(
      propertyId: 1,
      postImage:
          'https://www.exceptionalvillas.com/public/upload/listing_photos_resize/w1900xh1900-Villa-Infinity-1.jpg',
      postTitle: 'شقة 140 م²',
      description: '',
      date: '',
      images: [],
      area: 0.0,
      location: 'دمشق, شعلان',
      price: 2500,
      listingType: 'أجار',
      type: 'سياحي',
      rate: 3,
      avgRate: 3,
      isFavorite: false,
    ),
    TourismDto(
      propertyId: 2,
      postTitle: 'شقة 100 م²',
      location: 'دمشق, شعلان',
      rate: 2,
      price: 3500,
      postImage: Assets.images.property.path,
      area: 11,
      avgRate: 2,
      date: '2024-10-4',
      description: 'description',
      isFavorite: true,
      images: [],
      listingType: '',
      type: '',
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    initScrollControllers();
    searchController.addListener(_onSearchChanged);
    getAllTourism();
    getTopRateTourisem();
  }

  @override
  void onClose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    super.onClose();
  }

  Future<void> refreshPage() async {
    allTourismList.clear();
    pageAllTourism.value = 1;
    hasMoreAllTourism.value = true;
    getAllTourism();
    topTourisemList.clear();
    pageTopTourisem.value = 1;
    hasMoreTopTourisem.value = true;
    getTopRateTourisem();
  }

  void initScrollControllers() {
    scrollAllTourismController.addListener(() {
      if (scrollAllTourismController.position.maxScrollExtent ==
          scrollAllTourismController.offset) {
        getAllTourism(firstPage: false);
      }
    });
  }

  Future<void> getAllTourism({bool firstPage = true}) async {
    if (firstPage) {
      pageAllTourism.value = 1;
      hasMoreAllTourism.value = true;
    }
    if (!hasMoreAllTourism.value) {
      loadingAllTourismState.value = LoadingState.doneWithNoData;
      return;
    }
    loadingAllTourismState.value = LoadingState.loading;

    await Future.delayed(const Duration(milliseconds: 500));

    final filters = getSelectedFilters();
    AppResponse<PaginatedModel<TourismDto>> response;

    if (isSearch.value && searchController.text != "") {
      response = await tourismRepo.getTourismSearch(
        items: perPage,
        page: pageAllTourism.value,
        title: searchController.text,
      );
    } else {
      response = await tourismRepo.getTourismFilters(
        items: perPage,
        page: pageAllTourism.value,
        regionId: 0,
        cityId: 0,
        tag: "",
        orderByArea: filters["orderByArea"] ?? "",
        orderByPrice: filters["orderByPrice"] ?? "",
        orderByDate: filters["orderByDate"] ?? "",
      );
    }

    if (!response.success) {
      loadingAllTourismState.value = LoadingState.hasError;
      hasMoreAllTourism.value = false;
      CustomToasts(
        message: response.getErrorMessage(),
        type: CustomToastType.error,
      ).show();
      return;
    }

    firstPage
        ? allTourismList.value = response.data?.data ?? []
        : allTourismList.addAll(response.data!.data);

    hasMoreAllTourism.value = allTourismList.length < response.data!.totalItems;
    loadingAllTourismState.value =
        firstPage && allTourismList.isEmpty
            ? LoadingState.doneWithNoData
            : LoadingState.doneWithData;
    if (hasMoreAllTourism.value) {
      pageAllTourism.value++;
    }
  }

  Map<String, dynamic> getSelectedFilters() {
    final filters = <String, dynamic>{};
    final filterTitle = cardFilter[selectedFilterIndex.value].title;

    if (filterTitle == "السعر الأعلى") {
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

  void _onSearchChanged() async {
    final text = searchController.text.trim();
    if (text.isEmpty) {
      isSearch.value = false;
    } else {
      isSearch.value = true;
    }
    await refreshPage();
  }

  //?=================
  //? Get Top Tourisem

  final loadingTopTourisemState = LoadingState.loading.obs;
  final topTourisemList = <PropertyDto>[].obs;
  final pageTopTourisem = 1.obs;
  final hasMoreTopTourisem = false.obs;
  final scrollTopTourisemController = ScrollController();

  Future<void> getTopRateTourisem({bool firstPage = true}) async {
    if (firstPage) {
      pageTopTourisem.value = 1;
      hasMoreTopTourisem.value = true;
    }
    if (!hasMoreTopTourisem.value) {
      loadingTopTourisemState.value = LoadingState.doneWithNoData;
      return;
    }
    loadingTopTourisemState.value = LoadingState.loading;
    await Future.delayed(const Duration(seconds: 1));
    final response = await propertyRepo.getTopRateProperty(
      items: perPage,
      page: pageTopTourisem.value,
      type: "سياحي",
    );
    if (!response.success) {
      loadingTopTourisemState.value = LoadingState.hasError;
      hasMoreTopTourisem.value = false;
      CustomToasts(
        message: response.getErrorMessage(),
        type: CustomToastType.error,
      ).show();
      return;
    }
    hasMoreTopTourisem.value = false;
    firstPage
        ? topTourisemList.value = response.data?.data ?? []
        : topTourisemList.addAll(response.data!.data);
    log(topTourisemList.length.toString());
    log(response.data!.data.toString());
    hasMoreTopTourisem.value =
        topTourisemList.length < response.data!.totalItems;
    loadingTopTourisemState.value =
        firstPage && topTourisemList.isEmpty
            ? LoadingState.doneWithNoData
            : LoadingState.doneWithData;
    if (hasMoreTopTourisem.value) {
      pageTopTourisem.value++;
    }
  }
}
