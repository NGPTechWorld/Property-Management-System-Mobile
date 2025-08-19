// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:property_ms/core/utils/widgets/custom_toasts.dart';
import 'package:property_ms/data/dto/tourism_dto.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/data/models/app_response.dart';
import 'package:property_ms/data/models/paginated_model.dart';
import 'package:property_ms/data/models/tourism_model.dart';
import 'package:property_ms/data/repos/tourism_repositories.dart';
import 'package:property_ms/features/tourisem_page/sub_pages/tourism_details/widgets/reservation_bottom_sheet.dart';
import 'package:property_ms/features/tourisem_page/sub_pages/tourism_details/widgets/select_tourism_bottom_sheet.dart';

class TourismDetailsController extends GetxController {
  final loadingState = LoadingState.idle.obs;
  RxDouble rating = 4.0.obs;
  final TourismRepositories tourismRepo = Get.find<TourismRepositories>();
  
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
    isFavorite.value = tourismDetails!.isFavorite;
    // rating.value = tourismDetails!.rate;
    loadingState.value = LoadingState.doneWithData;
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

  // reservaion
  var allowedDays = 5.obs;
  final loadingReservaion = LoadingState.idle.obs;
  final celenderReservaion = <DateModel>[].obs;
  final double officeNaspeh = 0.25;
  final double arbonNaspeh = 0.1;
  var selectedDaysCount = 0.obs;
  final RxDouble totalPrice = 0.0.obs;
  reservaion() {
    ReservationBottomSheet.show();
    celenderReservaion.clear();
    final today = DateTime.now();
    selectedDaysCount.value = 0;
    celenderReservaion.addAll(
      List.generate(15, (i) {
        final date = today.add(Duration(days: i));
        return DateModel(
          day: DateFormat('EEEE', 'ar').format(date),
          month: DateFormat("MMM", "ar").format(date),
          numDay: DateFormat("d").format(date),
          isReseved: false,
          isSelect: false.obs,
          date: date,
        );
      }),
    );
    celenderReservaion[0].isReseved = true;
    celenderReservaion[3].isReseved = true;
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

  void confirmReservation() {
    // هنا تقدر تبعت selectedRange للباكند أو تحفظها
  }
}

class DateModel {
  final String day;
  final String month;
  final String numDay;
  bool isReseved;
  final RxBool isSelect;
  final DateTime date;

  DateModel({
    required this.day,
    required this.month,
    required this.numDay,
    required this.isReseved,
    required this.isSelect,
    required this.date,
  });
}
