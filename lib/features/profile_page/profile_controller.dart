import 'package:get/get.dart';
import 'package:property_ms/core/services/cache/cache_keys.dart';
import 'package:property_ms/core/services/cache/cache_service.dart';
import 'package:property_ms/features/main_page/main_controller.dart';

class ProfileController extends GetxController {
  final CacheService cacheService = Get.find<CacheService>();
  final mainController = Get.find<MainController>();
  logout() async {
    cacheService.saveData(key: kUserToken, value: null);
    mainController.changePage(0);
    Get.snackbar("نجاح", "تم تسجيل الخروج");
  }
  
}
