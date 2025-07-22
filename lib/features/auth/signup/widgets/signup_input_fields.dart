import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/widgets/custom_text_field.dart';

import '../signup_controller.dart';

class SignupInputFields extends GetView<SignupController> {
  const SignupInputFields({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignupController>();

    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          CustomTextField(
            title: 'الاسم الأول',
            hint: 'ادخل الاسم الأول',
            textEditingController: controller.firstNameController,
            textInputType: TextInputType.name,
            fillColor: ColorManager.primary2Color,
            hasBorder: false,
            autoValidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "هذا الحقل مطلوب";
              }
              return null;
            },
            icon: Assets.icons.userAccountIcon.svg(
              colorFilter: const ColorFilter.mode(
                ColorManager.primary5Color,
                BlendMode.srcIn,
              ),
            ),
          ),
          CustomTextField(
            title: 'الكنية',
            hint: 'ادخل الكنية',
            textEditingController: controller.lastNameController,
            textInputType: TextInputType.name,
            fillColor: ColorManager.primary2Color,
            hasBorder: false,
            autoValidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "هذا الحقل مطلوب";
              }
              return null;
            },
            icon: Assets.icons.userAccountIcon.svg(
              colorFilter: const ColorFilter.mode(
                ColorManager.primary5Color,
                BlendMode.srcIn,
              ),
            ),
          ),
          CustomTextField(
            title: 'الرقم',
            hint: '09xxxxxxxx',
            textEditingController: controller.phoneNumberController,
            textInputType: TextInputType.number,
            fillColor: ColorManager.primary2Color,
            hasBorder: false,
            autoValidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null ||
                  value.trim().isEmpty ||
                  !GetUtils.isPhoneNumber(value)) {
                return "هذا الحقل مطلوب";
              }
              return null;
            },
            icon: Assets.icons.callIcon.svg(
              colorFilter: const ColorFilter.mode(
                ColorManager.primary5Color,
                BlendMode.srcIn,
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
