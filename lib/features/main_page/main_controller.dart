import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/services/cache/cache_service.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/widgets/custom_toasts.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/features/exploration_page/exploration_page.dart';
import 'package:property_ms/features/home_page/home_page.dart';
import 'package:property_ms/features/offices_page/offices_page.dart';
import 'package:property_ms/features/profile_page/profile_page.dart';
import 'package:property_ms/features/reservation_page/reservation_page.dart';

class MainController extends GetxController {
  final CacheService cacheService = Get.find<CacheService>();
  final loadingMakePaymentState = LoadingState.idle.obs;
  PageController pageController = PageController();
  final pages = [
    const HomePage(),
    const OfficesPage(),
    const ExplorationPage(),
    const ReservationPage(),
    const ProfilePage(),
  ];
  final pageIndex = 0.obs;

  void changePage(int newIndex) {
    pageIndex.value = newIndex;
    pageController.animateToPage(
      newIndex,
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
    );
  }

  //! ElectPay
  Future<void> makePayment(String clientSecret) async {
    try {
      loadingMakePaymentState.value = LoadingState.loading;

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: 'My Store',
        ),
      );

      await Stripe.instance.presentPaymentSheet();

      loadingMakePaymentState.value = LoadingState.doneWithData;
      const CustomToasts(
        message: 'تمت عملية الدفع بنجاح',
        type: CustomToastType.success,
      ).show();
    } on StripeException catch (e) {
      loadingMakePaymentState.value = LoadingState.hasError;
      log(e.error.message!);
      log(e.error.localizedMessage!);
      CustomToasts(
        message: e.error.localizedMessage ?? 'حدث خطأ أثناء الدفع',
        type: CustomToastType.error,
      ).show();
    } catch (e) {
      loadingMakePaymentState.value = LoadingState.hasError;
      const CustomToasts(
        message: 'تعذر إتمام الدفع. تحقق من اتصالك بالإنترنت أو حاول لاحقًا.',
        type: CustomToastType.error,
      ).show();
    }
  }
}

class NavBarItem {
  final String name;
  final SvgGenImage? icon;

  NavBarItem(this.name, this.icon);
}
