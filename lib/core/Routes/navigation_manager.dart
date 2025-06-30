import 'package:get/get.dart';
import 'package:property_ms/core/routes/app_routes.dart';
import 'package:property_ms/features/auth/login/login_controller.dart';
import 'package:property_ms/features/auth/login/login_page.dart';
import 'package:property_ms/features/splash/splash_controller.dart';
import 'package:property_ms/features/splash/splash_page.dart';

abstract class NavigationManager {
  static final getPages = [
    GetPage(
      name: AppRoutes.splashRoute,
      page: () => const SplashPage(),
      binding: BindingsBuilder.put(() => SplashController()),
    ),
    GetPage(
      name: AppRoutes.loginRoute,
      page: () => const LoginPage(),
      binding: BindingsBuilder.put(() => LoginController()),
    ),
    // GetPage(
    //   name: AppRoutes.loginRoute,
    //   page: () => LoginPage(),
    //   binding: BindingsBuilder.put(() => LoginPageController()),
    // ),
  ];
}
