import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:property_ms/core/routes/app_routes.dart';
import 'package:property_ms/features/auth/login/login_controller.dart';
import 'package:property_ms/features/auth/login/login_page.dart';
import 'package:property_ms/features/auth/otp/otp_controller.dart';
import 'package:property_ms/features/auth/otp/otp_page.dart';
import 'package:property_ms/features/auth/resetpassword/reset_password_controller.dart';
import 'package:property_ms/features/auth/resetpassword/reset_password_page.dart';
import 'package:property_ms/features/auth/signup/signup_1/signup_controller.dart';
import 'package:property_ms/features/auth/signup/signup_1/signup_page.dart';
import 'package:property_ms/features/auth/signup/signup_2/signup_2_controller.dart';
import 'package:property_ms/features/auth/signup/signup_2/signup_2_page.dart';
import 'package:property_ms/features/main_page/main_controller.dart';
import 'package:property_ms/features/main_page/main_page.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/office_details_controller.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/office_details_page.dart';
import 'package:property_ms/features/property_page/property_controller.dart';
import 'package:property_ms/features/property_page/property_page.dart';
import 'package:property_ms/features/offices_page/sub_pages/report/report_office_controller.dart';
import 'package:property_ms/features/offices_page/sub_pages/report/report_office_page.dart';
import 'package:property_ms/features/services_page/services_controller.dart';
import 'package:property_ms/features/services_page/services_page.dart';
import 'package:property_ms/features/services_page/sub_pages/report/report_service_controller.dart';
import 'package:property_ms/features/services_page/sub_pages/report/report_service_page.dart';
import 'package:property_ms/features/services_page/sub_pages/services_details/service_detail_page.dart';
import 'package:property_ms/features/splash/splash_controller.dart';
import 'package:property_ms/features/splash/splash_page.dart';

abstract class NavigationManager {
  static final getPages = [
    GetPage(
      name: AppRoutes.mainRoute,
      page: () => const MainPage(),
      binding: BindingsBuilder.put(() => MainController()),
    ),
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
    GetPage(
      name: AppRoutes.servicesRoute,
      page: () => const ServicesPage(),
      binding: BindingsBuilder.put(() => ServicesController()),
    ),
    GetPage(
      name: AppRoutes.signUp1Route,
      page: () => const SignupPage(),
      binding: BindingsBuilder.put(() => SignupController()),
    ),
    GetPage(
      name: AppRoutes.signUp2Route,
      page: () => const Signup2Page(),
      binding: BindingsBuilder.put(() => Signup2Controller()),
    ),
    GetPage(
      name: AppRoutes.otpRoute,
      page: () => const OtpPage(),
      binding: BindingsBuilder.put(() => OtpController()),
    ),
    GetPage(
      name: AppRoutes.resetPasswordRoute,
      page: () => const ResetPasswordPage(),
      binding: BindingsBuilder.put(() => ResetPasswordController()),
    ),
    GetPage(
      name: AppRoutes.officeDetails,
      page: () => const OfficeDetailsPage(),
      binding: BindingsBuilder.put(() => OfficeDetailsController()),
    ),
    GetPage(
      name: AppRoutes.propertyRoute,
      page: () => const PropertyPage(),
      binding: BindingsBuilder.put(() => PropertyController()),
    ),
    GetPage(
      name: AppRoutes.serviceDetails,
      page: () => const ServiceDetailPage(),
      binding: BindingsBuilder.put(() => ServicesController()),
    ),
    GetPage(
      name: AppRoutes.reportOfficePage,
      page: () => const ReportOfficePage(),
      binding: BindingsBuilder.put(() => ReportOfficeController()),
    ),
    GetPage(
      name: AppRoutes.reportServicePage,
      page: () => const ReportServicePage(),
      binding: BindingsBuilder.put(() => ReportServiceController()),
    ),
    // GetPage(
    //   name: AppRoutes.loginRoute,
    //   page: () => LoginPage(),
    //   binding: BindingsBuilder.put(() => LoginPageController()),
    // ),
  ];
}
