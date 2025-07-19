import 'package:flutter/material.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/features/property_details/widget/detail_row.dart';
import 'package:property_ms/features/property_details/widget/model/detail_item.dart';

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
