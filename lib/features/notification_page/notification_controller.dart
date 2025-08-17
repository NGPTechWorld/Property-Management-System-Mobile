import 'package:get/get.dart';
import 'package:property_ms/core/utils/widgets/custom_toasts.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/data/models/notification_model.dart';
import 'package:property_ms/data/repos/users_repositories.dart';

class NotificationController extends GetxController {
  final UsersRepositories userRepo = Get.find<UsersRepositories>();
  @override
  void onInit() {
    super.onInit();
    getNotification();
  }

  final notificationsList = <NotificationModel>[].obs;
  final loadingState = LoadingState.idle.obs;

  Future<void> getNotification() async {
    if (loadingState.value == LoadingState.loading) return;
    loadingState.value = LoadingState.loading;
    Future.delayed(const Duration(seconds: 3));
    final response = await userRepo.myNotifications();

    if (!response.success) {
      loadingState.value = LoadingState.hasError;
      CustomToasts(
        message: response.getErrorMessage(),
        type: CustomToastType.error,
      ).show();
      return;
    }
    notificationsList.addAll(response.data!);
    loadingState.value =
        notificationsList.isEmpty
            ? LoadingState.doneWithNoData
            : LoadingState.doneWithData;
  }
}
