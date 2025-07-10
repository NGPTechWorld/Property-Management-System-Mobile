import 'dart:async';

import 'package:get/get.dart';

class OtpController extends GetxController {
  final String email = "email@gmail.com";
  final RxString pin1 = ''.obs;

  // Timer related
  final isResendEnabled = false.obs;
  final countdown = 180.obs; 
  Timer? _timer;
  @override
  void onInit() {
    super.onInit();
    startResendCountdown(); 
  }

  void startResendCountdown() {
    isResendEnabled.value = false;
    countdown.value = 180;

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

  void resendOtp() {
    if (!isResendEnabled.value) return;

    // TODO: Trigger OTP resend logic here
    print("OTP Resent!");

    startResendCountdown(); // restart timer after resend
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void verifyOtp(String pin) {
    print("OTP entered: $pin");
    // Example logic
    if (pin == "1234") {
      Get.snackbar("Success", "OTP is correct ${pin}");
    } else {
      Get.snackbar("Error", "Invalid OTP");
    }
    // Add your OTP verification logic here
  }
}
