import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/widgets/default_button.dart';
import 'package:property_ms/features/auth/signup/signup_1/signup_controller.dart';

class SignupSubmitButton extends GetView<SignupController> {
  const SignupSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      text: 'التالي',
      onPressed: () => controller.nextStep2(),
      color: ColorManager.primaryDark,
    );
  }
}
