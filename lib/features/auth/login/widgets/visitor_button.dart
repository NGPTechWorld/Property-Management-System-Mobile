import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/routes/app_routes.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/widgets/default_button.dart';
import 'package:property_ms/features/auth/login/login_controller.dart';

class VisitorButton extends GetView<LoginController> {
  const VisitorButton({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      text: 'تسجيل كزائر',
      foregroundColor: ColorManager.black,
      onPressed: () => Get.offNamed(AppRoutes.mainRoute),
      color: ColorManager.primary2Color,
    );
  }
}
