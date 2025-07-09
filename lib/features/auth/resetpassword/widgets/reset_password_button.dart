import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/widgets/default_button.dart';
import 'package:property_ms/features/auth/resetpassword/reset_password_controller.dart';

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ResetPasswordController>();

    return DefaultButton(
      text: 'التالي',
      onPressed: () {},
      color: ColorManager.primaryDark,
    );
  }
}
