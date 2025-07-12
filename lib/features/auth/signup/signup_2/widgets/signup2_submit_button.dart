import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/routes/app_routes.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/widgets/default_button.dart';

class Signup2SubmitButton extends StatelessWidget {
  const Signup2SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      text: 'إنشاء الحساب',
      onPressed: () => Get.toNamed(AppRoutes.otpRoute),
      color: ColorManager.primaryDark,
    );
  }
}
