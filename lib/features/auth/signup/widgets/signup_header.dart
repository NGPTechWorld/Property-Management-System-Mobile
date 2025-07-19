import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';

class SignupHeader extends StatelessWidget {
  const SignupHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            "إنشاء حساب\n جديد",
            textAlign: TextAlign.center,
            style: Get.textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: ColorManager.primaryDark,
              fontSize: FontSize.s16,
            ),
          ),
        ),
        const SizedBox(height: AppSize.s12),
        Center(
          child: Text(
            "المعلومات الشخصية",
            style: Get.textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: ColorManager.primary4Color,
              fontSize: FontSize.s16,
            ),
          ),
        ),
      ],
    );
  }
}
