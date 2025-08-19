import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:property_ms/core/Routes/app_routes.dart';

import 'package:property_ms/core/utils/widgets/custom_toasts.dart';
import 'package:property_ms/data/dto/payment_dto.dart';
import 'package:property_ms/data/dto/tourism_dto.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/data/models/app_response.dart';
import 'package:property_ms/data/models/availability_tourisem.dart';
import 'package:property_ms/data/models/paginated_model.dart';
import 'package:property_ms/data/models/tourism_model.dart';
import 'package:property_ms/data/repos/tourism_repositories.dart';
import 'package:property_ms/data/repos/users_repositories.dart';
import 'package:property_ms/features/main_page/main_controller.dart';
import 'package:property_ms/features/tourisem_page/sub_pages/tourism_details/widgets/reservation_bottom_sheet.dart';
import 'package:property_ms/features/tourisem_page/sub_pages/tourism_details/widgets/select_tourism_bottom_sheet.dart';

class TourismDetailsController extends GetxController {
  final TourismRepositories tourismRepo = Get.find<TourismRepositories>();
  final UsersRepositories userRepo = Get.find<UsersRepositories>();
  final mainController = Get.find<MainController>();
  final loadingState = LoadingState.idle.obs;
  RxDouble rating = 4.0.obs;

  final RxInt sliderIndex = 0.obs;
  var isLoadingImages = true.obs;
  RxBool isFavorite = false.obs;
  final int id = int.parse(Get.parameters['id']!);
  final ScrollController scrollController = ScrollController();
  final loadingRelatedTourismState = LoadingState.idle.obs;

  final tourismRelatedList = <TourismDto>[].obs;

  Future<void> getTourismRelated() async {
    if (loadingRelatedTourismState.value == LoadingState.loading) return;
    loadingRelatedTourismState.value = LoadingState.loading;
    final response = await tourismRepo.getTourismRelated(id: id);
    if (!response.success) {
      loadingRelatedTourismState.value = LoadingState.hasError;
      CustomToasts(
        message: response.getErrorMessage(),
        type: CustomToastType.error,
      ).show();
      return;
    }
    tourismRelatedList.value = response.data?.data ?? [];
    loadingRelatedTourismState.value = LoadingState.doneWithData;
  }

  TourismModel? tourismDetails;

  Future<void> getTourism() async {
    if (loadingState.value == LoadingState.loading) return;
    loadingState.value = LoadingState.loading;
    await Future.delayed(const Duration(seconds: 1));
    final response = await tourismRepo.getTourism(id: id);
    if (!response.success) {
      loadingState.value = LoadingState.hasError;
      CustomToasts(
        message: response.getErrorMessage(),
        type: CustomToastType.error,
      ).show();
      return;
    }
    tourismDetails = response.data;
    rating.value = tourismDetails!.avgRate;
    // rating.value = tourismDetails!.rate;
    loadingState.value = LoadingState.doneWithData;
  }

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }

  //?

  //!    Compare Tourism

  void openSelectTourismBottomSheet() async {
    await getAllTourism();
    SelectTourismBottomSheet.showAnswer();
  }
  //? Get All Property Filters

  final loadingAllTourismState = LoadingState.loading.obs;
  final allTourismList = <TourismDto>[].obs;
  final pageAllTourism = 1.obs;
  final perPage = 5;
  final hasMoreAllPropert = false.obs;
  final scrollAllPropertController = ScrollController();
  final searchController = TextEditingController();

  RxBool isSearch = false.obs;
  Future<void> getAllTourism({bool firstPage = true}) async {
    if (firstPage) {
      pageAllTourism.value = 1;
      hasMoreAllPropert.value = true;
    }
    if (!hasMoreAllPropert.value) {
      loadingAllTourismState.value = LoadingState.doneWithNoData;
      return;
    }
    loadingAllTourismState.value = LoadingState.loading;
    await Future.delayed(const Duration(seconds: 1));

    AppResponse<PaginatedModel<TourismDto>> response;
    if (isSearch.value && searchController.text != "") {
      response = await tourismRepo.getTourismSearch(
        items: 7,
        page: pageAllTourism.value,
        title: searchController.text,
      );
    } else {
      response = await tourismRepo.getTourismFilters(
        items: 7,
        page: pageAllTourism.value,
        regionId: 0,
        cityId: 0,
        tag: "",
        orderByArea: "",
        orderByPrice: "",
        orderByDate: "",
      );
    }

    if (!response.success) {
      loadingAllTourismState.value = LoadingState.hasError;
      hasMoreAllPropert.value = false;
      CustomToasts(
        message: response.getErrorMessage(),
        type: CustomToastType.error,
      ).show();
      return;
    }
    hasMoreAllPropert.value = false;
    firstPage
        ? allTourismList.value = response.data?.data ?? []
        : allTourismList.addAll(response.data!.data);
    // log(allPropertList.length.toString());
    // log(response.data!.data.toString());
    hasMoreAllPropert.value = allTourismList.length < response.data!.totalItems;
    loadingAllTourismState.value =
        firstPage && allTourismList.isEmpty
            ? LoadingState.doneWithNoData
            : LoadingState.doneWithData;
    if (hasMoreAllPropert.value) {
      pageAllTourism.value++;
    }
  }

  //?

  void updateRating(double newRating) {
    rating.value = newRating;
    print('Updated rating: $newRating');
  }

  @override
  void onInit() async {
    await getTourism();
    await getTourismRelated();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  //! Reservaion

  final loadingStateReservaion = LoadingState.idle.obs;
  var allowedDays = 0.obs;
  final loadingReservaion = LoadingState.idle.obs;
  final celenderReservaion = <DateModel>[].obs;
  AvailabilityModel? availabilityModel;
  double officeNaspeh = 0.0;
  double arbonNaspeh = 0.0;
  var selectedDaysCount = 0.obs;
  final RxDouble totalPrice = 0.0.obs;

  reservaion() async {
    celenderReservaion.clear();
    selectedDaysCount.value = 0;

    await getAvailability();
  }

  Future<void> getAvailability() async {
    if (loadingStateReservaion.value == LoadingState.loading) return;
    loadingStateReservaion.value = LoadingState.loading;
    await Future.delayed(const Duration(seconds: 1));
    final response = await tourismRepo.getTourismAvailability(id: id);
    if (!response.success) {
      loadingStateReservaion.value = LoadingState.hasError;
      CustomToasts(
        message: response.getErrorMessage(),
        type: CustomToastType.error,
      ).show();
      return;
    }
    availabilityModel = response.data;
    celenderReservaion.addAll(
      availabilityModel!.days.map((e) => e.toDateModel()).toList(),
    );
    allowedDays.value = availabilityModel!.availableCount;
    arbonNaspeh = availabilityModel!.deposit;
    officeNaspeh = availabilityModel!.commission;

    ReservationBottomSheet.show();
    loadingStateReservaion.value = LoadingState.doneWithData;
  }

  void toggleDaySelection(DateModel day) {
    if (day.isReseved) {
      const CustomToasts(
        message: "هذا اليوم محجوز",
        type: CustomToastType.error,
      ).show();
      return;
    }
    final selectedDays =
        celenderReservaion.where((d) => d.isSelect.value).toList();

    if (selectedDays.isEmpty) {
      day.isSelect.value = true;
      celenderReservaion.refresh();
    } else if (selectedDays.length == 1) {
      final firstDay = selectedDays.first;
      DateTime start =
          firstDay.date.isBefore(day.date) ? firstDay.date : day.date;
      DateTime end = firstDay.date.isAfter(day.date) ? firstDay.date : day.date;

      final range =
          celenderReservaion
              .where(
                (d) =>
                    !d.isReseved &&
                    !d.date.isBefore(start) &&
                    !d.date.isAfter(end),
              )
              .toList();
      final hasReserved = celenderReservaion
          .where(
            (d) =>
                d.date.isAfter(start.subtract(const Duration(days: 1))) &&
                d.date.isBefore(end.add(const Duration(days: 1))),
          )
          .any((d) => d.isReseved);

      if (hasReserved) {
        const CustomToasts(
          message: "الرينج يحتوي على أيام محجوزة",
          type: CustomToastType.error,
        ).show();
        for (var d in range) {
          d.isSelect.value = false;
          selectedDaysCount.value = 0;
          totalPrice.value = 0.0;
        }
        return;
      }
      if (range.length > allowedDays.value) {
        CustomToasts(
          message: "يمكنك اختيار ${allowedDays.value} أيام فقط",
          type: CustomToastType.error,
        ).show();

        return;
      }
      for (var d in celenderReservaion) {
        d.isSelect.value = false;
      }
      for (var d in range) {
        d.isSelect.value = true;
      }
      celenderReservaion.refresh();
    } else {
      for (var d in celenderReservaion) {
        d.isSelect.value = false;
      }
      day.isSelect.value = true;
      celenderReservaion.refresh();
    }
    selectedDaysCount.value =
        celenderReservaion.where((d) => d.isSelect.value).length;
    double totalDayPrice = tourismDetails!.price * selectedDaysCount.value;
    double officePrice = totalDayPrice * officeNaspeh;
    totalPrice.value = officePrice + totalDayPrice;
  }

  confirmReservation() async {
    if (loadingStateReservaion.value == LoadingState.loading) return;
    loadingStateReservaion.value = LoadingState.loading;
    double amount = (arbonNaspeh * totalPrice.value);
    double rounded = double.parse(amount.toStringAsFixed(1));

    final response = await userRepo.paymentCreate(amount: rounded);
    if (!response.success) {
      loadingStateReservaion.value = LoadingState.hasError;
      CustomToasts(
        message: response.getErrorMessage(),
        type: CustomToastType.error,
      ).show();
      return;
    }
    final bool statePay = await mainController.makePayment(
      response.data!.clientSecret,
    );
    log(statePay.toString());
    if (statePay) {
      await postBookTourism(response.data!);
    } else {}
    loadingStateReservaion.value = LoadingState.doneWithData;
  }

  postBookTourism(PaymentDto pay) async {
    loadingStateReservaion.value = LoadingState.loading;
    double amount = (arbonNaspeh * totalPrice.value);
    double deposit = double.parse(amount.toStringAsFixed(1));
    double totalPriceD = double.parse(totalPrice.value.toStringAsFixed(1));
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    List<DateModel> selectedDays =
        celenderReservaion.where((d) => d.isSelect.value).toList();
    if (selectedDays.isNotEmpty) {
      selectedDays.sort((a, b) => a.date.compareTo(b.date));

      String startDate = formatter.format(selectedDays.first.date);
      String endDate = formatter.format(selectedDays.last.date);
      log(pay.paymentId);
      final response = await tourismRepo.postBookTourism(
        propertyId: tourismDetails!.propertyId,
        startDate: startDate,
        endDate: endDate,
        paymentId: pay.paymentId,
        deposit: deposit,
        totalPrice: totalPriceD,
      );
      if (!response.success) {
        loadingStateReservaion.value = LoadingState.hasError;
        CustomToasts(
          message: response.getErrorMessage(),
          type: CustomToastType.error,
        ).show();
        return;
      }
      CustomToasts(
        message: response.successMessage!,
        type: CustomToastType.success,
      ).show();

      Get.offAllNamed(AppRoutes.mainRoute);
      await Future.delayed(const Duration(seconds: 1));
      mainController.changePage(3);
    }

    loadingStateReservaion.value = LoadingState.doneWithData;
  }
}
