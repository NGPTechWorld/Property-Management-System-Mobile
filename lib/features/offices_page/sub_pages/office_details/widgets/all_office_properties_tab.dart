import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/features/widgets/card_filter.dart';
import 'package:property_ms/features/widgets/property_rent_card2_small.dart';
import 'package:property_ms/features/widgets/property_sale_card2_small.dart';
import '../office_details_controller.dart';

class AllOfficePropertiesTab extends GetView<OfficeDetailsController> {
  const AllOfficePropertiesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: AppSize.s16),
          Obx(() {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(
                controller.cardFilters.length,
                (index) => CardFilter(
                  model: controller.cardFilters[index],
                  isSelect: controller.selectedFilterIndex.value == index,
                ),
              ),
            );
          }),
          const SizedBox(height: AppSize.s16),

          Obx(() {
            return Column(
              children: List.generate(
                controller.filteredProperties.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: AppPadding.p12),
                  child: _buildPropertyCard(
                    controller.filteredProperties[index],
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildPropertyCard(dynamic item) {
    if (item is PropertyRentCard2SmallModel) {
      return PropertyRentCard2Small(model: item);
    } else if (item is PropertySaleCard2SmallModel) {
      return PropertySaleCard2Small(model: item);
    } else {
      return const SizedBox();
    }
  }
}
