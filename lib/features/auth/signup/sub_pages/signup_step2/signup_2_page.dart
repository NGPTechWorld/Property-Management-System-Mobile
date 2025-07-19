import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/logo_app.dart';
import 'package:property_ms/core/utils/widgets/screen_bottom_effect.dart';
import 'package:property_ms/features/auth/signup/signup_controller.dart';

import 'widgets/signup2_header.dart';
import 'widgets/signup2_form_fields.dart';
import 'widgets/signup2_submit_button.dart';

class Signup2Page extends GetView<SignupController> {
  const Signup2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: Get.context!.height),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LogoApp(withTitle: true),
                    SizedBox(height: AppSize.s12),
                    Signup2Header(),
                    SizedBox(height: AppSize.s16),
                    Signup2FormFields(),
                    SizedBox(height: AppSize.s18),
                    Signup2SubmitButton(),
                  ],
                ),
              ),
            ),
          ),
          const ScreenBottomEffect(),
        ],
      ),
    );
  }
}
