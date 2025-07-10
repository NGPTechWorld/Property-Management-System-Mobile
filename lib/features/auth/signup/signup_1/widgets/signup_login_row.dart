import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';

class SignupLoginRow extends StatelessWidget {
  const SignupLoginRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'هل تمتلك حساب؟  ',
          style: Get.textTheme.bodySmall,
        ),
        GestureDetector(
          onTap: Get.back,
          child: Text(
            'تسجيل الدخول',
            style: Get.textTheme.bodySmall?.copyWith(
              color: ColorManager.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
