import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/default_button.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/features/login/login_controller.dart';

class LoginButton extends GetView<LoginController> {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p24),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Obx(
              () => DefaultButton(
                text: "تسجيل الدخول",
                onPressed: () {},
                disabled: controller.loadingState.value == LoadingState.loading,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
