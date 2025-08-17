import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/widgets/custom_toasts.dart';
import 'package:property_ms/data/dto/tourism_dto.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/data/models/app_response.dart';
import 'package:property_ms/data/models/paginated_model.dart';
import 'package:property_ms/data/models/tourism_model.dart';
import 'package:property_ms/data/repos/tourism_repositories.dart';
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
}
