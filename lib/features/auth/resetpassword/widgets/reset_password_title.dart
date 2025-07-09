import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordTitle extends StatelessWidget {
  const ResetPasswordTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'إعادة تعيين كلمة المرور',
      style: Get.textTheme.titleMedium,
    );
  }
}
