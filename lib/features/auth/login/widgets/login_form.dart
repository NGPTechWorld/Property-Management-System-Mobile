import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/Routes/app_routes.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
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
              fontSize: FontSize.s16,
            ),
          ),
        ),
        const SizedBox(height: AppSize.s16),
        CustomTextField(
          title: 'البريد الإلكتروني',
          hint: 'example@gmail.com',
          textEditingController: controller.emailController,
          textInputType: TextInputType.emailAddress,
          fillColor: ColorManager.primary2Color,
          hasBorder: false,
          icon: Assets.icons.mailIcon.svg(
            colorFilter: const ColorFilter.mode(
              ColorManager.primary5Color,
              BlendMode.srcIn,
            ),
          ),
        ),
        Obx(
          () => CustomTextField(
            title: "كلمة المرور",
            hint: "xxx xxx xxx",
            textEditingController: controller.passwordController,
            textInputType: TextInputType.visiblePassword,
            fillColor: ColorManager.primary2Color,
            hasBorder: false,
            icon: Assets.icons.passwordIcon.svg(
              colorFilter: const ColorFilter.mode(
                ColorManager.primary5Color,
                BlendMode.srcIn,
              ),
            ),
            obscureText: controller.isPasswordHidden.value,
            suffixIcon: GestureDetector(
              onTap: () {
                controller.isPasswordHidden.toggle();
              },
              child:
                  controller.isPasswordHidden.value
                      ? Assets.icons.eyeHide.svg(
                        colorFilter: const ColorFilter.mode(
                          ColorManager.primary5Color,
                          BlendMode.srcIn,
                        ),
                      )
                      : Assets.icons.eyeIcon.svg(
                        colorFilter: const ColorFilter.mode(
                          ColorManager.primary5Color,
                          BlendMode.srcIn,
                        ),
                      ),
            ),
          ),
        ),
        const SizedBox(height: AppSize.s14),
        Row(
          children: [
            Text(
              'لا تمتلك حساب؟  ',
              style: Get.textTheme.bodySmall?.copyWith(),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.signUp1Route);
              },
              child: Text(
                'إنشاء حساب',
                style: Get.textTheme.bodySmall?.copyWith(
                  color: ColorManager.primaryColor,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSize.s12),
        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.resetPasswordRoute);
          },
          child: Text(
            'نسيت كلمة المرور؟',
            style: Get.textTheme.bodySmall?.copyWith(
              color: ColorManager.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
