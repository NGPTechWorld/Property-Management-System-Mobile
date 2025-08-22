import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/services/cache/cache_keys.dart';
import '../../core/routes/app_routes.dart';
import '../../core/services/cache/cache_service.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> scaleAnimation;
  late Animation<double> opacityAnimation;

  final CacheService cacheService = Get.find<CacheService>();

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
    );

    opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
    );

    animationController.forward();

    Future.delayed(const Duration(seconds: 3), () {
      navigate();
    });
  }

  Future<void> navigate() async {
    final seenOnboarding =
        cacheService.getData(key: 'seenOnboarding') as bool? ?? false;

    if (!seenOnboarding) {
      Get.offAllNamed(AppRoutes.onboardingRoute);
    } else {
      final user = cacheService.getData(key: kUserToken);
      if (user == null) {
        Get.offAllNamed(AppRoutes.loginRoute);
      } else {
        Get.offAllNamed(AppRoutes.mainRoute);
      }
    }
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
