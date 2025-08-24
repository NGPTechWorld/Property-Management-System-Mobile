import 'package:get/get.dart';
import 'package:property_ms/core/utils/widgets/custom_toasts.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/data/models/notification_model.dart';
import 'package:property_ms/data/repos/users_repositories.dart';

class NotificationController extends GetxController {
  final UsersRepositories userRepo = Get.find<UsersRepositories>();
  final unreadCount = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getNotification();
  }

  final notificationsList = <NotificationModel>[].obs;
  final loadingState = LoadingState.idle.obs;
  refreshPage() async {
    notificationsList.clear();
    getNotification();
  }

  Future<void> getNotification() async {
    if (loadingState.value == LoadingState.loading) return;
    loadingState.value = LoadingState.loading;
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
    unreadCount.value =
        notificationsList
            .where((notification) => notification.isRead == false)
            .length;
    loadingState.value =
        notificationsList.isEmpty
            ? LoadingState.doneWithNoData
            : LoadingState.doneWithData;
  }

  Future<void> readNotification() async {
    loadingState.value = LoadingState.loading;
    for (var i in notificationsList) {
      if (!i.isRead) {
        await userRepo.readNotifications(id: i.id);
      }
    }
    loadingState.value =
        notificationsList.isEmpty
            ? LoadingState.doneWithNoData
            : LoadingState.doneWithData;
  }

  void clearUnread() {
    unreadCount.value = 0;
  }
}
