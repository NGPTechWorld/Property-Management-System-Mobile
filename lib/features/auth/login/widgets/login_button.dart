import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/app_button.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/features/auth/login/login_controller.dart';

class LoginButton extends GetView<LoginController> {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p24),
      child: Obx(
        () => AppButton(
          text: 'تسجيل الدخول',
          onPressed: () => controller.login(),
          backgroundColor: ColorManager.primaryDark,
          loadingMode: controller.loadingState.value == LoadingState.loading,
        ),
      ),
    );
  }
}
