import 'package:get/get.dart';
import 'package:property_ms/core/routes/app_routes.dart';
import 'package:property_ms/core/services/cache/cache_service.dart';

class OnboardingController extends GetxController {
  final CacheService cacheService = Get.find<CacheService>();

  Future<void> completeOnboarding() async {
    await cacheService.saveData(key: 'seenOnboarding', value: true);
    Get.offAllNamed(AppRoutes.loginRoute); // or mainRoute
  }
}
