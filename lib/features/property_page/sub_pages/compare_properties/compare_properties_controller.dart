import 'dart:developer';

import 'package:get/get.dart';
import 'package:property_ms/core/utils/widgets/custom_toasts.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';

import 'package:property_ms/data/models/property_model.dart';
import 'package:property_ms/data/repos/property_repositories.dart';

class ComparePropertiesController extends GetxController {
  final PropertyRepositories propertyRepo = Get.find<PropertyRepositories>();
  final loadingState = LoadingState.idle.obs;

  PropertyModel? property1;
  PropertyModel? property2;
  final int id1 = int.parse(Get.parameters['id1']!);
  final int id2 = int.parse(Get.parameters['id2']!);
  @override
  void onInit() {
    super.onInit();
    get2Property();
  }

  Future<void> get2Property() async {
    if (loadingState.value == LoadingState.loading) return;
    loadingState.value = LoadingState.loading;
    Future.delayed(const Duration(seconds: 3));
    final response = await propertyRepo.getPropertyCompare(id1: id1, id2: id2);

    if (!response.success) {
      loadingState.value = LoadingState.hasError;
      CustomToasts(
        message: response.getErrorMessage(),
        type: CustomToastType.error,
      ).show();
      return;
    }
    log(response.data.toString());
    property1 = response.data![0];
    property2 = response.data![1];
    loadingState.value = LoadingState.doneWithData;
  }
}
