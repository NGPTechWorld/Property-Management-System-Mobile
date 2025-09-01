import 'package:get/get.dart';
import 'package:property_ms/core/services/cache/cache_keys.dart';
import 'package:property_ms/core/services/cache/cache_service.dart';
import 'package:property_ms/core/utils/widgets/custom_toasts.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';

import 'package:property_ms/data/models/service_model.dart';
import 'package:property_ms/data/repos/services_repositories.dart';
import 'package:property_ms/features/main_page/main_controller.dart';

class ServiceDetailController extends GetxController {
  final ServicesRepositories serviceRepo = Get.find<ServicesRepositories>();
  final mainController = Get.find<MainController>();
  final CacheService cacheService = Get.find<CacheService>();
  final loadingState = LoadingState.idle.obs;
  final int id = int.parse(Get.parameters['id']!);
  RxDouble rating = 4.0.obs;
  final myRating = 4.0.obs;

  ServiceModel? serviceDetaitModel;

  @override
  void onInit() async {
    super.onInit();
    getService();
  }

  Future<void> refreshPage() async {
    getService();
  }

  Future<void> getService() async {
    if (loadingState.value == LoadingState.loading) return;
    loadingState.value = LoadingState.loading;
    Future.delayed(const Duration(seconds: 3));
    final response = await serviceRepo.getService(id: id);

    if (!response.success) {
      loadingState.value = LoadingState.hasError;
      CustomToasts(
        message: response.getErrorMessage(),
        type: CustomToastType.error,
      ).show();
      return;
    }
    serviceDetaitModel = response.data;
    rating.value = serviceDetaitModel!.avgRate;
    loadingState.value = LoadingState.doneWithData;
  }

  //?    Rating
  void updateRating(double newRating) async {
    myRating.value = newRating;
    if (cacheService.getData(key: kUserToken) != null) {
      await postPropertyRate();
    } else {
      const CustomToasts(
        message: "يجب عليك تسجيل الدخول",
        type: CustomToastType.warning,
      ).show();
    }
  }

  Future<void> postPropertyRate() async {
    final response = await serviceRepo.postServiceFeeback(
      id: serviceDetaitModel!.id,
      rate: myRating.value,
    );

    if (!response.success) {
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
  }

  //? ====================
}
