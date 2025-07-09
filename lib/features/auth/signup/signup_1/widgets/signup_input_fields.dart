import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/widgets/custom_text_field.dart';

import '../signup_controller.dart';

class SignupInputFields extends StatelessWidget {
  const SignupInputFields({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignupController>();

    return Column(
      children: [
        CustomTextField(
          title: 'الاسم الأول',
          hint: 'حسن',
          textEditingController: controller.firstNameController,
          textInputType: TextInputType.name,
          fillColor: ColorManager.primary2Color,
          hasBorder: false,
          icon: Assets.icons.userAccountIcon.svg(
            colorFilter: const ColorFilter.mode(
              ColorManager.primary5Color,
              BlendMode.srcIn,
            ),
          ),
        ),
        CustomTextField(
          title: 'الكنية',
          hint: 'زعيتر',
          textEditingController: controller.lastNameController,
          textInputType: TextInputType.name,
          fillColor: ColorManager.primary2Color,
          hasBorder: false,
          icon: Assets.icons.userAccountIcon.svg(
            colorFilter: const ColorFilter.mode(
              ColorManager.primary5Color,
              BlendMode.srcIn,
            ),
          ),
        ),
        CustomTextField(
          title: 'الرقم',
          hint: '0987654321',
          textEditingController: controller.phoneNumberController,
          textInputType: TextInputType.number,
          fillColor: ColorManager.primary2Color,
          hasBorder: false,
          icon: Assets.icons.callIcon.svg(
            colorFilter: const ColorFilter.mode(
              ColorManager.primary5Color,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }
}
