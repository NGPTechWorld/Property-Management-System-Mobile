import 'package:get/get.dart';
import 'package:property_ms/core/services/api/api_service.dart';
import 'package:property_ms/core/services/cache/cache_service.dart';
import 'package:property_ms/core/services/cache/get_storage_helper.dart';
import 'package:property_ms/core/translations/app_translation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:property_ms/data/repos/users_repositories.dart';
import 'package:property_ms/firebase_options.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CacheService>(GetStorageHelper());
    Get.put(ApiService());
    Get.put<UsersRepositories>(ImpUsersRepositories());

    //TODO: un comment this when firebase is ready
    // Get.put(NotificationRepo()).initialize();
    // Get.put(UsersRepo());
    // Get.put(PermissionService());
  }

  static Future<void> init() async {
    await Get.find<CacheService>().init();
    await AppTranslations.init();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await PushNotification.initialise();
  }
}
