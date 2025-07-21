import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';

class DetailsContainer extends StatelessWidget {
  final List<DetailItem> details;
  const DetailsContainer({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p16,
        vertical: AppPadding.p8,
      ),
      margin: const EdgeInsets.symmetric(vertical: AppPadding.p12),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(AppSize.s12),
      ),
      child: Column(
        children: List.generate(details.length, (index) {
          final detail = details[index];
          return Column(
            children: [
              DetailRow(
                title: detail.label,
                value: detail.value,
                icon: detail.icon,
              ),
              if (index != details.length - 1)
                const Divider(height: AppSize.s24),
            ],
          );
        }),
      ),
    );
  }
}

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

class DetailItem {
  final String label;
  final String value;
  final IconData icon;

  DetailItem({required this.label, required this.value, required this.icon});
}
