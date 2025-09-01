import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordTitle extends StatelessWidget {
  const ResetPasswordTitle({super.key, this.email});

  final String? email;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('إعادة تعيين كلمة المرور', style: Get.textTheme.titleMedium),
        const SizedBox(height: 10),
        Text(
          email!,
          style: Get.textTheme.bodyMedium?.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
