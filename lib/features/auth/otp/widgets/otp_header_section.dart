import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/logo_app.dart';
import 'package:property_ms/features/auth/otp/otp_controller.dart';

class OtpHeaderSection extends StatelessWidget {
  const OtpHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OtpController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const LogoApp(withTitle: true),
        const SizedBox(height: AppSize.s20),
        Text(
          "تحقق من البريد الإلكتروني",
          style: Get.textTheme.titleMedium,
        ),
        const SizedBox(height: AppSize.s12),
        Text(
          "ادخل الكود الذي ارسلناه على البريد التالي",
          style: Get.textTheme.labelSmall?.copyWith(
            color: ColorManager.primary4Color,
          ),
        ),
        const SizedBox(height: AppSize.s4),
        Text(
          controller.email,
          style: Get.textTheme.bodySmall?.copyWith(
            color: ColorManager.primaryColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: AppSize.s16),
      ],
    );
  }
}
