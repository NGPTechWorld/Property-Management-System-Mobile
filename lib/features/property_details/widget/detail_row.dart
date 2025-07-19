import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';

class DetailRow extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const DetailRow({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: ColorManager.primaryColor),
          const SizedBox(width: AppSize.s12),
          Expanded(
            child: Text(
              title,
              style: Get.textTheme.bodyMedium?.copyWith(
                color: ColorManager.textColor1,
              ),
            ),
          ),
          Text(
            value,
            style: Get.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
