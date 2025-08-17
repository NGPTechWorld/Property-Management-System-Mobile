import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';

class ServiceTypeChip extends StatelessWidget {
  final String label;

  const ServiceTypeChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    if (label == 'سياحي') {
      return Container(
        padding: const EdgeInsets.symmetric(
          vertical: AppPadding.p4,
          horizontal: AppPadding.p16,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: ColorManager.purble, width: 2),
          borderRadius: BorderRadius.circular(30),
          color: ColorManager.lightPurble,
        ),
        child: Text(
          label,
          style: Get.textTheme.bodySmall!.copyWith(
            color: ColorManager.purble,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.symmetric(
          vertical: AppPadding.p4,
          horizontal: AppPadding.p16,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: ColorManager.primaryColor, width: 2),
          borderRadius: BorderRadius.circular(30),
          color: ColorManager.primaryColor.withAlpha(20),
        ),
        child: Text(
          label,
          style: Get.textTheme.bodySmall!.copyWith(
            color: ColorManager.primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }
  }
}
