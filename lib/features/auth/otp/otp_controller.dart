import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/routes/app_routes.dart';
import 'package:property_ms/core/utils/widgets/custom_toasts.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/data/repos/users_repositories.dart';

class OtpController extends GetxController {
  final loadingState = LoadingState.idle.obs;
  final UsersRepositories userRepo = Get.find<UsersRepositories>();
  final otpController = TextEditingController();
  final String email = Get.arguments['email'];
  final RxString pin1 = ''.obs;
  final String type = Get.arguments['type'];

  // Timer related
  final isResendEnabled = false.obs;
  final countdown = 180.obs;
  Timer? _timer;
  @override
  void onInit() {
    super.onInit();
    resendOtp();
    startResendCountdown();
  }

  void startResendCountdown() {
    isResendEnabled.value = false;
    countdown.value = 300;

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown.value > 0) {
        countdown.value--;
      } else {
        isResendEnabled.value = true;
        timer.cancel();
      }
    });
  }

  Future<void> resendOtp() async {
    loadingState.value = LoadingState.loading;

    final response = await userRepo.resentOtp(email: email, type: type);

    if (!response.success) {
      loadingState.value = LoadingState.hasError;
      CustomToasts(
        message: response.getErrorMessage(),
        type: CustomToastType.error,
      ).show();
      return;
    }
    CustomToasts(
      message: response.successMessage!,
      type: CustomToastType.success,
    ).show();
    loadingState.value = LoadingState.doneWithData;

    startResendCountdown(); // restart timer after resend
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  Future<void> verifyOtp() async {
    loadingState.value = LoadingState.loading;

    final response = await userRepo.confirem(
      email: email,
      otp: otpController.text,
    );

    if (!response.success) {
      loadingState.value = LoadingState.hasError;
      CustomToasts(
        message: response.getErrorMessage(),
        type: CustomToastType.error,
      ).show();
      return;
    }
    CustomToasts(
      message: response.successMessage!,
      type: CustomToastType.success,
    ).show();
    Get.offAllNamed(AppRoutes.loginRoute);
    loadingState.value = LoadingState.doneWithData;
  }
}
