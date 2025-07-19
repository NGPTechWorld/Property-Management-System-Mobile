import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/widgets/app_button.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/features/auth/signup/signup_controller.dart';

class Signup2SubmitButton extends GetView<SignupController> {
  const Signup2SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AppButton(
        text: 'إنشاء الحساب',
        onPressed: () => controller.register(),
        backgroundColor: ColorManager.primaryDark,
        loadingMode: controller.loadingState.value == LoadingState.loading,
      ),
    );
  }
}
