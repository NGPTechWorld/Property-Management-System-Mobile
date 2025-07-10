import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/Routes/app_routes.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/widgets/default_button.dart';

class SignupSubmitButton extends StatelessWidget {
  const SignupSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      text: 'التالي',
      onPressed: () => Get.toNamed(AppRoutes.signUp2Route),
      color: ColorManager.primaryDark,
    );
  }
}
