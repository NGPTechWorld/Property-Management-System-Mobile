import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
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
            "أهلاً وسهلاً بك",
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: ColorManager.primary4Color,
              fontSize: FontSize.s24,
            ),
          ),
        ),
        CustomTextField(
          title: 'البريد الإلكتروني',
          hint: 'example@gmail.com',
          textEditingController: controller.usernameController,
          textInputType: TextInputType.emailAddress,
             fillColor: ColorManager.primary2Color,
          hasBorder: false,
        ),
        CustomTextField(
          title: "كلمة السر",
          hint: "xxx xxx xxx",
          textEditingController: controller.passwordController,
          textInputType: TextInputType.visiblePassword,
          fillColor: ColorManager.primary2Color,
          hasBorder: false,
        ),
      ],
    );
  }
}
