import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/features/property_page/sub_pages/property_details/property_details_controller.dart';
import 'package:property_ms/features/widgets/property_rent_card.dart';
import 'package:property_ms/features/widgets/property_sale_card.dart';

class RelatedPropertiesWidgets extends StatelessWidget {
  const RelatedPropertiesWidgets({super.key, required this.controller});

  final PropertyDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppSize.s24),
        Text(
          'عقارات ذات صلة',
          style: Get.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: AppSize.s8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(controller.propertyList.length, (index) {
              final item = controller.propertyList[index];
              if (item is PropertyRentCardModel) {
                return const SizedBox();
         //       return PropertyRentCard(model: item);
              } else if (item is PropertySaleCardModel) {
                return PropertySaleCard(model: item);
              } else {
                return const SizedBox();
              }
            }),
          ),
        ),
        const SizedBox(height: AppSize.s24),
      ],
    );
  }
}
