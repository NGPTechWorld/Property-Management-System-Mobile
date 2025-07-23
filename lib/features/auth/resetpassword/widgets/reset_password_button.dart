import 'package:flutter/material.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/widgets/default_button.dart';

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
  //  final controller = Get.find<ResetPasswordController>();

    return DefaultButton(
      text: 'التالي',
      onPressed: () {},
      color: ColorManager.primaryDark,
    );
  }
}
