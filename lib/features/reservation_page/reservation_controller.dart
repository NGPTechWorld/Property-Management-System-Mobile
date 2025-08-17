import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/widgets/custom_toasts.dart';
import 'package:property_ms/data/dto/user_reservation_dto.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/data/repos/users_repositories.dart';
import 'package:property_ms/features/reservation_page/widgets/rent_reservation.dart';
import 'package:property_ms/features/reservation_page/widgets/tourisem_reservation.dart';

class ReservationController extends GetxController {
  final UsersRepositories userRepo = Get.find<UsersRepositories>();
  final pageIndex = 0.obs;
  ScrollController scrollController = ScrollController();
  PageController pageController = PageController();

  void selectTabScreen(int key) {
    pageIndex.value = key;
    pageController.jumpToPage(key);
    refreshPageProperty();
    refreshPageTourisem();
  }

  final navButtons = {
    "الإيجارات العقارية": Assets.icons.property,
    "الإيجارات السياحية": Assets.icons.tourisem,
  };
  final pages = [const RentReservation(), const TourisemReservation()];

  @override
  void onInit() {
    super.onInit();
    initScrollControllers();
    getUserReservation();
    getUserReservationTourisem();
  }

  Future<void> refreshPageProperty() async {
    userReservationList.clear();
    pageUserReservation.value = 1;
    hasMoreUserReservation.value = true;
    await getUserReservation();
  }

  Future<void> refreshPageTourisem() async {
    userReservationTourisemList.clear();
    pageUserReservationTourisem.value = 1;
    hasMoreUserReservationTourisem.value = true;
    await getUserReservationTourisem();
  }

  void initScrollControllers() {
    scrollUserReservationController.addListener(() {
      if (scrollUserReservationController.position.maxScrollExtent ==
          scrollUserReservationController.offset) {
        getUserReservation(firstPage: false);
      }
    });
    scrollUserReservationTourisemController.addListener(() {
      if (scrollUserReservationTourisemController.position.maxScrollExtent ==
          scrollUserReservationTourisemController.offset) {
        getUserReservationTourisem(firstPage: false);
      }
    });
  }

  //? Get User Reservation  Property

  final loadingUserReservationState = LoadingState.loading.obs;
  final userReservationList = <UserReservationDto>[].obs;
  final pageUserReservation = 1.obs;
  final hasMoreUserReservation = false.obs;
  final scrollUserReservationController = ScrollController();

  Future<void> getUserReservation({bool firstPage = true}) async {
    if (firstPage) {
      pageUserReservation.value = 1;
      hasMoreUserReservation.value = true;
    }
    if (!hasMoreUserReservation.value) {
      loadingUserReservationState.value = LoadingState.doneWithNoData;
      return;
    }
    loadingUserReservationState.value = LoadingState.loading;
    await Future.delayed(const Duration(seconds: 1));
    final response = await userRepo.getUserReservation(
      items: 7,
      page: pageUserReservation.value,
      type: "عقاري",
    );
    if (!response.success) {
      loadingUserReservationState.value = LoadingState.hasError;
      hasMoreUserReservation.value = false;
      CustomToasts(
        message: response.getErrorMessage(),
        type: CustomToastType.error,
      ).show();
      return;
    }
    hasMoreUserReservation.value = false;
    firstPage
        ? userReservationList.value = response.data?.data ?? []
        : userReservationList.addAll(response.data!.data);
    log(userReservationList.length.toString());
    log(response.data!.data.toString());
    hasMoreUserReservation.value =
        userReservationList.length < response.data!.totalItems;
    loadingUserReservationState.value =
        firstPage && userReservationList.isEmpty
            ? LoadingState.doneWithNoData
            : LoadingState.doneWithData;
    if (hasMoreUserReservation.value) {
      pageUserReservation.value++;
    }
  }

  //?=================
  //? Get User Reservation  Tourisem

  final loadingUserReservationTourisemState = LoadingState.loading.obs;
  final userReservationTourisemList = <UserReservationDto>[].obs;
  final pageUserReservationTourisem = 1.obs;
  final hasMoreUserReservationTourisem = false.obs;
  final scrollUserReservationTourisemController = ScrollController();

  Future<void> getUserReservationTourisem({bool firstPage = true}) async {
    if (firstPage) {
      pageUserReservationTourisem.value = 1;
      hasMoreUserReservationTourisem.value = true;
    }
    if (!hasMoreUserReservationTourisem.value) {
      loadingUserReservationTourisemState.value = LoadingState.doneWithNoData;
      return;
    }
    loadingUserReservationTourisemState.value = LoadingState.loading;
    await Future.delayed(const Duration(seconds: 1));
    final response = await userRepo.getUserReservation(
      items: 7,
      page: pageUserReservationTourisem.value,
      type: "سياحي",
    );
    if (!response.success) {
      loadingUserReservationTourisemState.value = LoadingState.hasError;
      hasMoreUserReservationTourisem.value = false;
      CustomToasts(
        message: response.getErrorMessage(),
        type: CustomToastType.error,
      ).show();
      return;
    }
    hasMoreUserReservationTourisem.value = false;
    firstPage
        ? userReservationTourisemList.value = response.data?.data ?? []
        : userReservationTourisemList.addAll(response.data!.data);
    log(userReservationTourisemList.length.toString());
    log(response.data!.data.toString());
    hasMoreUserReservationTourisem.value =
        userReservationTourisemList.length < response.data!.totalItems;
    loadingUserReservationTourisemState.value =
        firstPage && userReservationTourisemList.isEmpty
            ? LoadingState.doneWithNoData
            : LoadingState.doneWithData;
    if (hasMoreUserReservationTourisem.value) {
      pageUserReservationTourisem.value++;
    }
  }

  //?=================
}
