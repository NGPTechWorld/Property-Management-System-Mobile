import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/features/auth/otp/otp_controller.dart';

class OtpInputField extends StatelessWidget {
  const OtpInputField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OtpController>();
    return Center(
      child: Pinput(
        onCompleted: (pin) => controller.pin1.value = pin,
        focusedPinTheme: PinTheme(
          textStyle: TextStyle(
            fontSize: FontSize.s20, // or 20
            fontWeight: FontWeight.w600,
          ),

          width: AppSize.sWidth * .17,
          height: AppSize.sWidth * .17,
          decoration: BoxDecoration(
            border: Border.all(color: ColorManager.primaryDark),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        autofocus: true,
        validator: (pin) {
          // Optionally implement validator
        },
      ),
    );
  }
}
