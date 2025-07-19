import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/screen_bottom_effect.dart';

import 'signup_controller.dart';
import 'widgets/signup_avatar.dart';
import 'widgets/signup_header.dart';
import 'widgets/signup_input_fields.dart';
import 'widgets/signup_login_row.dart';
import 'widgets/signup_submit_button.dart';

class SignupPage extends GetView<SignupController> {
  const SignupPage({super.key});

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
                    SizedBox(height: AppSize.s100),
                    SignupHeader(),
                    SizedBox(height: AppSize.s18),
                    SignupAvatar(),
                    SignupInputFields(),
                    SizedBox(height: AppSize.s18),
                    SignupLoginRow(),
                    SizedBox(height: AppSize.s18),
                    SignupSubmitButton(),
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
