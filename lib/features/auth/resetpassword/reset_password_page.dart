import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/default_divider.dart';
import 'package:property_ms/core/utils/widgets/logo_app.dart';
import 'package:property_ms/core/utils/widgets/screen_bottom_effect.dart';
import 'package:property_ms/features/auth/resetpassword/widgets/password_fields.dart';
import 'package:property_ms/features/auth/resetpassword/widgets/reset_password_button.dart';
import 'package:property_ms/features/auth/resetpassword/widgets/reset_password_title.dart';

import 'reset_password_controller.dart';

class ResetPasswordPage extends GetView<ResetPasswordController> {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: Get.context!.height),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const LogoApp(withTitle: true),
                    const SizedBox(height: AppSize.s20),
                    ResetPasswordTitle(email: controller.email ?? ''),
                    const SizedBox(height: AppSize.s18),
                    const DefaultDivider(),
                    const SizedBox(height: AppSize.s20),
                    const NewPasswordField(),
                    const SizedBox(height: AppSize.s100),
                    const ResetPasswordButton(),
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
