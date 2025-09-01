import 'dart:developer' show log;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/widgets/custom_toasts.dart';

import 'package:property_ms/data/dto/post_dto.dart';
import 'package:property_ms/data/dto/property_dto.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/data/enums/syrian_governorate.dart';
import 'package:property_ms/data/models/app_response.dart';
import 'package:property_ms/data/repos/post_repositories.dart';

import 'package:property_ms/features/widgets/card_filter.dart';
import 'package:property_ms/features/widgets/question_bottum_sheets/question_type_widget.dart';

class MyPostsController extends GetxController {
  // Repository
  final PostRepositories postRepo = Get.find<PostRepositories>();

  //! Filters
  final selectedFilterIndex = 0.obs;
  final filteredPostsList = <PostDto>[].obs;

  final List<CardFilterModel> cardFilter = [
    CardFilterModel(title: "الكل"),
    CardFilterModel(title: "شراء", icon: Assets.icons.property),
    CardFilterModel(title: "أجار", icon: Assets.icons.property),
    CardFilterModel(title: "قيد الانتظار"),
    CardFilterModel(title: "مقبول"),
    CardFilterModel(title: "مرفوض"),
  ];

  //! Posts
  final loadingAllPosts = LoadingState.loading.obs;
  final allPostsList = <PostDto>[].obs;

  //! Suggestions
  final loadingSuggestionsState = LoadingState.loading.obs;
  final suggestionsdList = <PropertyDto>[].obs;
  final pageTopPropert = 1.obs;
  final hasMoreTopPropert = false.obs;
  final scrollTopPropertController = ScrollController();
  final perPage = 5;

  //! Region
  final selectedRegionId = 0.obs;
  List<QuestionModel> postQuestionsFilters = [
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
  ];

  // ------------------ Lifecycle ------------------
  @override
  void onInit() async {
    super.onInit();
    await getAllPosts();
  }

  // ------------------ Posts ------------------
  Future<void> getAllPosts() async {
    loadingAllPosts.value = LoadingState.loading;
    await Future.delayed(const Duration(seconds: 2));

    final AppResponse<List<PostDto>> response =
        await postRepo.getAllUserPosts();

    if (!response.success) {
      loadingAllPosts.value = LoadingState.hasError;
      CustomToasts(
        message: response.getErrorMessage(),
        type: CustomToastType.error,
      ).show();
      return;
    }

    allPostsList.value = response.data!;
    selectFilter(selectedFilterIndex.value);
    loadingAllPosts.value =
        response.data!.isEmpty
            ? LoadingState.doneWithNoData
            : LoadingState.doneWithData;
  }

  Future<void> refreshPage() async {
    allPostsList.clear();
    await getAllPosts();
  }

  Future<void> refreshDetailsPage(int id) async {
    suggestionsdList.clear();
    await getUserSuggestionsProperties(postId: id);
  }

  Future<void> deletePost(int postId) async {
    await postRepo.deletePost(postId: postId);
    await refreshPage();
  }

  Future<void> createPost() async {
    final AppResponse response = await postRepo.createUserPost(
      title: " بشراء منزل في دمشق",
      budget: 100,
      type: "شراء",
      description: "فيلا بمساحة لا تقل عن 233 م2",
      regionId: 50,
    );

    if (!response.success) {
      CustomToasts(
        message: response.getErrorMessage(),
        type: CustomToastType.error,
      ).show();
      return;
    }

    CustomToasts(
      message: response.successMessage ?? "تمت إضافة المنشور بنجاح",
      type: CustomToastType.success,
    ).show();

    await refreshPage();
  }

  // ------------------ Suggestions ------------------
  Future<void> getUserSuggestionsProperties({
    bool firstPage = true,
    required int postId,
  }) async {
    if (firstPage) {
      pageTopPropert.value = 1;
      hasMoreTopPropert.value = true;
    }

    if (!hasMoreTopPropert.value) {
      loadingSuggestionsState.value = LoadingState.doneWithNoData;
      return;
    }

    loadingSuggestionsState.value = LoadingState.loading;
    await Future.delayed(const Duration(seconds: 1));

    final response = await postRepo.getUserSuggestionsProperties(
      postId: postId,
      items: perPage,
      page: pageTopPropert.value,
    );

    if (!response.success) {
      loadingSuggestionsState.value = LoadingState.hasError;
      hasMoreTopPropert.value = false;
      CustomToasts(
        message: response.getErrorMessage(),
        type: CustomToastType.error,
      ).show();
      return;
    }

    hasMoreTopPropert.value = false;
    firstPage
        ? suggestionsdList.value = response.data?.data ?? []
        : suggestionsdList.addAll(response.data!.data);

    log(suggestionsdList.length.toString());
    log(response.data!.data.toString());

    hasMoreTopPropert.value =
        suggestionsdList.length < response.data!.totalItems;

    loadingSuggestionsState.value =
        firstPage && suggestionsdList.isEmpty
            ? LoadingState.doneWithNoData
            : LoadingState.doneWithData;

    if (hasMoreTopPropert.value) {
      pageTopPropert.value++;
    }
  }

  // ------------------ Region ------------------
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

    postQuestionsFilters[1].controller.text = "";
    postQuestionsFilters[1].selectedIndex.value = null;
    postQuestionsFilters[1].answers.clear();
    postQuestionsFilters[1].answers.addAll(locationAnswers);
  }

  void updateRegionId(int id) {
    selectedRegionId.value = id;
  }

  // ------------------ Filters ------------------
  void selectFilter(int index) {
    selectedFilterIndex.value = index;

    switch (index) {
      case 0:
        filteredPostsList.value = allPostsList;
        break;
      case 1:
        filteredPostsList.value =
            allPostsList.where((post) => post.type == "شراء").toList();
        break;
      case 2:
        filteredPostsList.value =
            allPostsList.where((post) => post.type == "أجار").toList();
        break;
      case 3:
        filteredPostsList.value =
            allPostsList
                .where((post) => post.status == "قيد الانتظار")
                .toList();
        break;
      case 4:
        filteredPostsList.value =
            allPostsList.where((post) => post.status == "مقبول").toList();
        break;
      case 5:
        filteredPostsList.value =
            allPostsList.where((post) => post.status == "مرفوض").toList();
        break;
    }
  }
}
