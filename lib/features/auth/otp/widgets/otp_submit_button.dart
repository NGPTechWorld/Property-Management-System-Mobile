import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/widgets/default_button.dart';
import 'package:property_ms/features/auth/otp/otp_controller.dart';

class OtpSubmitButton extends StatelessWidget {
  const OtpSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OtpController>();
    return DefaultButton(
      text: 'إرسال',
      onPressed: () => controller.verifyOtp(controller.pin1.value),
      color: ColorManager.primaryDark,
    );
  }
}
