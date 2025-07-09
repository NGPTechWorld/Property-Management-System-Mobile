import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/features/auth/otp/otp_controller.dart';

class ResendCodeText extends StatelessWidget {
  const ResendCodeText({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OtpController>();

    return Obx(() {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('لم يصلك الكود؟ ', style: Get.textTheme.bodySmall),
          controller.isResendEnabled.value
              ? GestureDetector(
                onTap: controller.resendOtp,
                child: Text(
                  'إعادة إرسال الكود',
                  style: Get.textTheme.bodySmall?.copyWith(
                    color: ColorManager.primaryColor,
                  ),
                ),
              )
              : Text(
                'إعادة الإرسال خلال ${formatTime(controller.countdown.value)}',
                style: Get.textTheme.bodySmall?.copyWith(color: Colors.grey),
              ),
        ],
      );
    });
  }
}

String formatTime(int seconds) {
  final minutes = seconds ~/ 60;
  final secs = seconds % 60;
  final secStr = secs.toString().padLeft(2, '0');
  return '$minutes:$secStr';
}
