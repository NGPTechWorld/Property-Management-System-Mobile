import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/custom_text_field.dart';
import 'package:property_ms/features/auth/login/login_controller.dart';

class LoginForm extends GetView<LoginController> {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            "تسجيل الدخول",
            style: Theme.of(
              context,
            ).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
          child: Text(
            "اسم المستخدم",
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        TextField(controller: controller.usernameController),
        CustomTextField(
          title: "كلمة السر",
          hint: "ادخل كلمة السر",
          textEditingController: controller.passwordController,
          textInputType: TextInputType.visiblePassword,
        ),
      ],
    );
  }
}
