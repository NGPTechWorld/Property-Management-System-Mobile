import 'package:get/get.dart';
import 'package:property_ms/core/services/api/api_service.dart';
import 'package:property_ms/core/services/cache/cache_service.dart';
import 'package:property_ms/core/services/cache/get_storage_helper.dart';
import 'package:property_ms/core/translations/app_translation.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CacheService>(GetStorageHelper());
    Get.put(ApiService());
    
    //TODO: un comment this when firebase is ready
    // Get.put(NotificationRepo()).initialize();
    // Get.put(UsersRepo());
    // Get.put(PermissionService());
  }

  static Future<void> init() async {
    await Get.find<CacheService>().init();
    await AppTranslations.init();
  }
}
