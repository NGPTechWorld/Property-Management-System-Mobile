import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/widgets/custom_text_field.dart';
import 'package:property_ms/features/auth/resetpassword/reset_password_controller.dart';

class NewPasswordField extends StatelessWidget {
  const NewPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ResetPasswordController>();

    return Obx(
      () => CustomTextField(
        title: "كلمة المرور الجديدة",
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
          onTap: () => controller.isPasswordHidden.toggle(),
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
    );
  }
}

class ConfirmPasswordField extends StatelessWidget {
  const ConfirmPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ResetPasswordController>();

    return Obx(
      () => CustomTextField(
        title: "تأكيد كلمة المرور",
        hint: "xxx xxx xxx",
        textEditingController: controller.verifectionPasswordController,
        textInputType: TextInputType.visiblePassword,
        fillColor: ColorManager.primary2Color,
        hasBorder: false,
        icon: Assets.icons.passwordIcon.svg(
          colorFilter: const ColorFilter.mode(
            ColorManager.primary5Color,
            BlendMode.srcIn,
          ),
        ),
        obscureText: controller.isVerifectionPasswordHidden.value,
        suffixIcon: GestureDetector(
          onTap: () => controller.isVerifectionPasswordHidden.toggle(),
          child:
              controller.isVerifectionPasswordHidden.value
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
    );
  }
}
