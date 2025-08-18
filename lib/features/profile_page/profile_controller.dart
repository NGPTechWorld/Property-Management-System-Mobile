import 'package:get/get.dart';
import 'package:property_ms/core/services/cache/cache_keys.dart';
import 'package:property_ms/core/services/cache/cache_service.dart';
import 'package:property_ms/core/utils/widgets/custom_toasts.dart';
import 'package:property_ms/data/dto/profile_dto.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/data/repos/users_repositories.dart';
import 'package:property_ms/features/main_page/main_controller.dart';

class ProfileController extends GetxController {
  final UsersRepositories usersRepo = Get.find<UsersRepositories>();
  final CacheService cacheService = Get.find<CacheService>();
  final mainController = Get.find<MainController>();
  final loadingState = LoadingState.idle.obs;

  logout() async {
    cacheService.saveData(key: kUserToken, value: null);
    mainController.changePage(0);
    Get.snackbar("نجاح", "تم تسجيل الخروج");
  }

  ProfileDto? profileInfo;
  Future<void> getUserInfo() async {
    if (loadingState.value == LoadingState.loading) return;
    loadingState.value = LoadingState.loading;
    await Future.delayed(const Duration(seconds: 2));
    final response = await usersRepo.getUserProfileInfo();

    if (!response.success) {
      loadingState.value = LoadingState.hasError;
      CustomToasts(
        message: response.getErrorMessage(),
        type: CustomToastType.error,
      ).show();
      return;
    }
    profileInfo = response.data;
    loadingState.value = LoadingState.doneWithData;
  }

  Future<void> refreshPage() async {
    profileInfo = null;
    loadingState.value = LoadingState.idle;

    await getUserInfo();
  }

  @override
  void onInit() async {
    await getUserInfo();
    super.onInit();
  }
}
