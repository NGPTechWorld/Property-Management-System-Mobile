import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/screen_bottom_effect.dart';
import 'package:property_ms/features/auth/otp/widgets/otp_header_section.dart';
import 'package:property_ms/features/auth/otp/widgets/otp_input_field.dart';
import 'package:property_ms/features/auth/otp/widgets/otp_submit_button.dart';
import 'package:property_ms/features/auth/otp/widgets/resend_code_text.dart';

import 'otp_controller.dart';

class OtpPage extends GetView<OtpController> {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.delete<OtpController>();
    // Get.put(OtpController());
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: Get.context!.height),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    OtpHeaderSection(),
                    OtpInputField(),
                    SizedBox(height: AppSize.s20),
                    ResendCodeText(),
                    SizedBox(height: AppSize.s100),
                    OtpSubmitButton(),
                  ],
                ),
              ),
            ),
          ),
          // if keyboard appear disable it
          if (MediaQuery.of(context).viewInsets.bottom == 0)
            const Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: ScreenBottomEffect(),
            ),
        ],
      ),
    );
  }
}
