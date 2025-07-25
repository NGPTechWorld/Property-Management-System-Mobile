import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:property_ms/core/utils/widgets/custom_toasts.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/data/models/property_model.dart';
import 'package:property_ms/data/repos/property_repositories.dart';

class PropertyDetailsController extends GetxController {
  final rating = 4.0.obs;

  final PropertyRepositories propertyRepo = Get.find<PropertyRepositories>();
  final loadingState = LoadingState.idle.obs;
  final RxInt sliderIndex = 0.obs;
  final isLoadingImages = true.obs;
  final int id = int.parse(Get.parameters['id']!);
  final ScrollController scrollController = ScrollController();

  // late PropertyDetailsModel propertyDetails;

  PropertyModel? propertyDetails;

  @override
  void onInit() {
    super.onInit();
    getProperty();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void updateRating(double newRating) {
    rating.value = newRating;

    // Optional: update the model
    // model.rate = newRating.toString();

    // Optional: send rating to backend or local DB
    print('Updated rating: $newRating');
  }

  Future<void> getProperty() async {
    if (loadingState.value == LoadingState.loading) return;
    loadingState.value = LoadingState.loading;
    Future.delayed(const Duration(seconds: 3));
    final response = await propertyRepo.getProperty(id: id);

    if (!response.success) {
      loadingState.value = LoadingState.hasError;
      CustomToasts(
        message: response.getErrorMessage(),
        type: CustomToastType.error,
      ).show();
      return;
    }
    propertyDetails = response.data;
    rating.value = propertyDetails!.avgRate;
    loadingState.value = LoadingState.doneWithData;
  }
}
