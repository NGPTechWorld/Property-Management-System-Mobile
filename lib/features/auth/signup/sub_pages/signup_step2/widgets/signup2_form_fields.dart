import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/widgets/custom_text_field.dart';
import 'package:property_ms/features/auth/signup/signup_controller.dart';

class Signup2FormFields extends GetView<SignupController> {
  const Signup2FormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKeyStep2,
      child: Column(
        children: [
          CustomTextField(
            title: 'البريد الإلكتروني',
            hint: 'example@gmail.com',
            textEditingController: controller.emailController,
            textInputType: TextInputType.emailAddress,
            fillColor: ColorManager.primary2Color,
            hasBorder: false,
            autoValidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "هذا الحقل مطلوب";
              } else if (!GetUtils.isEmail(value)) {
                return "الايميل خطأ";
              }
              return null;
            },
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
              autoValidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "هذا الحقل مطلوب";
                }
                return null;
              },
              icon: Assets.icons.passwordIcon.svg(
                colorFilter: const ColorFilter.mode(
                  ColorManager.primary5Color,
                  BlendMode.srcIn,
                ),
              ),
              obscureText: controller.isPasswordHidden.value,
              suffixIcon: GestureDetector(
                onTap: controller.isPasswordHidden.toggle,
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
          Obx(
            () => CustomTextField(
              title: "تأكيد كلمة المرور",
              hint: "xxx xxx xxx",
              textEditingController: controller.verifectionPasswordController,
              textInputType: TextInputType.visiblePassword,
              fillColor: ColorManager.primary2Color,
              hasBorder: false,
              autoValidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "هذا الحقل مطلوب";
                } else if (value != controller.passwordController.text) {
                  return "كلمة السر ليست متطابقة!";
                }
                return null;
              },
              icon: Assets.icons.passwordIcon.svg(
                colorFilter: const ColorFilter.mode(
                  ColorManager.primary5Color,
                  BlendMode.srcIn,
                ),
              ),
              obscureText: controller.isVerifectionPasswordHidden.value,
              suffixIcon: GestureDetector(
                onTap: controller.isVerifectionPasswordHidden.toggle,
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
          ),
        ],
      ),
    );
  }
}
