import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/widgets/custom_toasts.dart';
import 'package:property_ms/data/dto/user_purchases_dto.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/data/repos/users_repositories.dart';

class MySalesController extends GetxController {
  final UsersRepositories userRepo = Get.find<UsersRepositories>();

  @override
  void onInit() {
    super.onInit();
    initScrollControllers();
    getUserPurchases();
  }

  void initScrollControllers() {
    scrollUserPurchasesController.addListener(() {
      if (scrollUserPurchasesController.position.maxScrollExtent ==
          scrollUserPurchasesController.offset) {
        getUserPurchases(firstPage: false);
      }
    });
  }

  Future<void> refreshPage() async {
    userPurchasesList.clear();
    pageUserPurchases.value = 1;
    hasMoreUserPurchases.value = true;
    await getUserPurchases();
  }
  //? Get User Reservation  Property

  final loadingUserPurchasesState = LoadingState.loading.obs;
  final userPurchasesList = <UserPurchasesDto>[].obs;
  final pageUserPurchases = 1.obs;
  final hasMoreUserPurchases = false.obs;
  final scrollUserPurchasesController = ScrollController();

  Future<void> getUserPurchases({bool firstPage = true}) async {
    if (firstPage) {
      pageUserPurchases.value = 1;
      hasMoreUserPurchases.value = true;
    }
    if (!hasMoreUserPurchases.value) {
      loadingUserPurchasesState.value = LoadingState.doneWithNoData;
      return;
    }
    loadingUserPurchasesState.value = LoadingState.loading;
    await Future.delayed(const Duration(seconds: 3));
    final response = await userRepo.getUserPurchases(
      items: 7,
      page: pageUserPurchases.value,
    );
    if (!response.success) {
      loadingUserPurchasesState.value = LoadingState.hasError;
      hasMoreUserPurchases.value = false;
      CustomToasts(
        message: response.getErrorMessage(),
        type: CustomToastType.error,
      ).show();
      return;
    }
    hasMoreUserPurchases.value = false;
    firstPage
        ? userPurchasesList.value = response.data?.data ?? []
        : userPurchasesList.addAll(response.data!.data);
    log(userPurchasesList.length.toString());
    log(response.data!.data.toString());
    hasMoreUserPurchases.value =
        userPurchasesList.length < response.data!.totalItems;
    loadingUserPurchasesState.value =
        firstPage && userPurchasesList.isEmpty
            ? LoadingState.doneWithNoData
            : LoadingState.doneWithData;
    if (hasMoreUserPurchases.value) {
      pageUserPurchases.value++;
    }
  }

  //?=================
}
