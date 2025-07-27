import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';

class ComparisonItem {
  final String label;
  final String value1;
  final String value2;
  final IconData icon;

  ComparisonItem({
    required this.label,
    required this.value1,
    required this.value2,
    required this.icon,
  });
}

class ComparisonContainer extends StatelessWidget {
  final List<ComparisonItem> comparisons;

  const ComparisonContainer({super.key, required this.comparisons});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p12),
      margin: const EdgeInsets.symmetric(vertical: AppPadding.p12),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(AppSize.s12),
      ),
      child: Column(
        children: List.generate(comparisons.length, (index) {
          final item = comparisons[index];
          return Column(
            children: [
              ComparisonRow(item: item),
              if (index != comparisons.length - 1)
                const Divider(height: AppSize.s18),
            ],
          );
        }),
      ),
    );
  }
}

class ComparisonRow extends StatelessWidget {
  final ComparisonItem item;

  const ComparisonRow({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              item.value1,
              textAlign: TextAlign.center,
              style: Get.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: ColorManager.textColor1,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  item.icon,
                  size: AppSize.s20,
                  color: ColorManager.primaryColor,
                ),
                Text(
                  item.label,
                  style: Get.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              item.value2,
              textAlign: TextAlign.center,
              style: Get.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: ColorManager.textColor1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
