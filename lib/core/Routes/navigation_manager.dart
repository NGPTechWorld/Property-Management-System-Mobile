import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/route_manager.dart';
import 'package:property_ms/core/routes/app_routes.dart';
import 'package:property_ms/features/auth/login/login_controller.dart';
import 'package:property_ms/features/auth/login/login_page.dart';
import 'package:property_ms/features/auth/otp/otp_controller.dart';
import 'package:property_ms/features/auth/otp/otp_page.dart';
import 'package:property_ms/features/auth/resetpassword/reset_password_controller.dart';
import 'package:property_ms/features/auth/resetpassword/reset_password_page.dart';
import 'package:property_ms/features/auth/signup/signup_controller.dart';
import 'package:property_ms/features/auth/signup/signup_page.dart';
import 'package:property_ms/features/auth/signup/sub_pages/signup_step2/signup_2_page.dart';
import 'package:property_ms/features/contract_details/contract_details.dart';
import 'package:property_ms/features/main_page/main_controller.dart';
import 'package:property_ms/features/main_page/main_page.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/office_details_page.dart';
import 'package:property_ms/features/offices_page/sub_pages/report/report_office_controller.dart';
import 'package:property_ms/features/offices_page/sub_pages/report/report_office_page.dart';
import 'package:property_ms/features/profile_page/sub_pages/account_info_page/account_info_controller.dart';
import 'package:property_ms/features/profile_page/sub_pages/account_info_page/account_info_page.dart';
import 'package:property_ms/features/profile_page/sub_pages/favorites_page/favorites_controller.dart';
import 'package:property_ms/features/profile_page/sub_pages/favorites_page/favorites_page.dart';
import 'package:property_ms/features/profile_page/sub_pages/my_posts/my_posts_controller.dart';
import 'package:property_ms/features/profile_page/sub_pages/my_posts/my_posts_page.dart';
import 'package:property_ms/features/profile_page/sub_pages/my_posts/sub_pages/post_details/post_details_controller.dart';
import 'package:property_ms/features/profile_page/sub_pages/my_posts/sub_pages/post_details/post_details_page.dart';
import 'package:property_ms/features/profile_page/sub_pages/my_sales_page/my_sales_controller.dart';
import 'package:property_ms/features/profile_page/sub_pages/my_sales_page/my_sales_page.dart';
import 'package:property_ms/features/profile_page/sub_pages/support/sub_pages/chat/chat_controller.dart';
import 'package:property_ms/features/profile_page/sub_pages/support/sub_pages/chat/chat_page.dart';
import 'package:property_ms/features/profile_page/sub_pages/support/support_controller.dart';
import 'package:property_ms/features/profile_page/sub_pages/support/support_page.dart';
import 'package:property_ms/features/property_page/property_controller.dart';
import 'package:property_ms/features/property_page/property_page.dart';
import 'package:property_ms/features/property_page/sub_pages/compare_properties/compare_properties_controller.dart';
import 'package:property_ms/features/property_page/sub_pages/compare_properties/compare_properties_page.dart';
import 'package:property_ms/features/property_page/sub_pages/property_details/property_details_controller.dart';
import 'package:property_ms/features/property_page/sub_pages/property_details/property_details_page.dart';
import 'package:property_ms/features/services_page/services_controller.dart';
import 'package:property_ms/features/services_page/services_page.dart';
import 'package:property_ms/features/services_page/sub_pages/report/report_service_controller.dart';
import 'package:property_ms/features/services_page/sub_pages/report/report_service_page.dart';
import 'package:property_ms/features/services_page/sub_pages/services_details/service_detail_controller.dart';
import 'package:property_ms/features/services_page/sub_pages/services_details/service_detail_page.dart';
import 'package:property_ms/features/splash/splash_controller.dart';
import 'package:property_ms/features/splash/splash_page.dart';
import 'package:property_ms/features/tourisem_page/sub_pages/compare_tourism/compare_tourism_controller.dart';
import 'package:property_ms/features/tourisem_page/sub_pages/compare_tourism/compare_tourism_page.dart';
import 'package:property_ms/features/tourisem_page/sub_pages/tourism_details/tourism_details_controller.dart';
import 'package:property_ms/features/tourisem_page/sub_pages/tourism_details/tourism_details_page.dart';
import 'package:property_ms/features/tourisem_page/tourisem_controller.dart';
import 'package:property_ms/features/tourisem_page/tourisem_page.dart';

abstract class NavigationManager {
  static final getPages = [
    GetPage(
      name: AppRoutes.mainRoute,
      page: () => const MainPage(),
      binding: BindingsBuilder.put(() => MainController()),
    ),
    GetPage(
      name: AppRoutes.splashRoute,
      page: () => SplashPage(),
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
    GetPage(name: AppRoutes.signUp2Route, page: () => const Signup2Page()),
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
    ),
    GetPage(
      name: AppRoutes.propertyRoute,
      page: () => const PropertyPage(),
      binding: BindingsBuilder.put(() => PropertyController()),
      // transition: Transition.native,
      // transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.serviceDetails,
      page: () => const ServiceDetailPage(),
      binding: BindingsBuilder.put(() => ServiceDetailController()),
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
    GetPage(
      name: AppRoutes.propertyDetailsPage,
      page: () => const PropertyDetailsPage(),
    ),
    GetPage(
      name: AppRoutes.tourisemRoute,
      page: () => const TourisemPage(),
      binding: BindingsBuilder.put(() => TourisemController()),
    ),
    GetPage(
      name: AppRoutes.tourismDetailsPage,
      page: () => const TourismDetailsPage(),
      binding: BindingsBuilder.put(() => TourismDetailsController()),
    ),
    GetPage(
      name: AppRoutes.mySalesRoute,
      page: () => const MySalesPage(),
      binding: BindingsBuilder.put(() => MySalesController()),
    ),
    GetPage(
      name: AppRoutes.contractDetailsRoute,
      page: () => const ContractDetails(),
    ),
    GetPage(
      name: AppRoutes.favoritesRoute,
      page: () => const FavoritesPage(),
      binding: BindingsBuilder.put(() => FavoritesController()),
    ),
    GetPage(
      name: AppRoutes.comparePropertiesPage,
      page: () => const ComparePropertiesPage(),
      binding: BindingsBuilder.put(() => ComparePropertiesController()),
    ),
    GetPage(
      name: AppRoutes.accountInfoRoute,
      page: () => const AccountInfoPage(),
      binding: BindingsBuilder.put(() => AccountInfoController()),
    ),
    GetPage(
      name: AppRoutes.compareTourismPage,
      page: () => const CompareTourismPage(),
      binding: BindingsBuilder.put(() => CompareTourismController()),
    ),
    GetPage(
      name: AppRoutes.supportPage,
      page: () => const SupportPage(),
      binding: BindingsBuilder.put(() => SupportController()),
    ),
    GetPage(
      name: AppRoutes.chatPage,
      page: () => const ChatPage(),
      binding: BindingsBuilder.put(() => ChatController()),
    ),
    GetPage(
      name: AppRoutes.myPostsPage,
      page: () => const MyPostsPage(),
      binding: BindingsBuilder.put(() => MyPostsController()),
    ),
    GetPage(
      name: AppRoutes.postDetailsPage,
      page: () => const PostDetailsPage(),
      binding: BindingsBuilder.put(() => PostDetailsController()),
    ),
    // GetPage(
    //   name: AppRoutes.loginRoute,
    //   page: () => LoginPage(),
    //   binding: BindingsBuilder.put(() => LoginPageController()),
    // ),
  ];
}
