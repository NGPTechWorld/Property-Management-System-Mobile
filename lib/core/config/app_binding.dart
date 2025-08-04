import 'package:get/get.dart';
import 'package:property_ms/core/services/api/api_service.dart';
import 'package:property_ms/core/services/cache/cache_service.dart';
import 'package:property_ms/core/services/cache/get_storage_helper.dart';
import 'package:property_ms/core/translations/app_translation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:property_ms/data/repos/offices_repositories.dart';
import 'package:property_ms/data/repos/property_repositories.dart';
import 'package:property_ms/data/repos/services_repositories.dart';
import 'package:property_ms/data/repos/users_repositories.dart';
import 'package:property_ms/firebase_options.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CacheService>(GetStorageHelper());
    Get.put(ApiService());
    Get.put<UsersRepositories>(ImpUsersRepositories());
    Get.put<PropertyRepositories>(ImpPropertyRepositories());
    Get.put<OfficesRepositories>(ImpOfficesRepositories());
    Get.put<ServicesRepositories>(ImpServicesRepositories());

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
    Stripe.publishableKey =
        'pk_test_51RRWQY06D6FmvGT4dqW0A34yH45MTIDe4hveJ1xx1urwPE3PJB6utgLtYFpfVc1UlIve5EerS45AAyn7heo1J2v700VQMzruXM'; // حط المفتاح تبعك

    await Stripe.instance.applySettings();
    await getToken();
  }
}

Future<void> getToken() async {
  final fcmToken = await FirebaseMessaging.instance.getToken();
  log('FCM Token: $fcmToken');
}
