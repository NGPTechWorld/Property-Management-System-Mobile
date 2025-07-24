import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/routes/app_routes.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/features/property_page/property_controller.dart';
import 'package:property_ms/features/widgets/property_rent_card2_small.dart';
import 'package:property_ms/features/widgets/property_sale_card2_small.dart';

class AllProperty extends GetView<PropertyController> {
  const AllProperty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
          child: Text(
            "كل العقارات",
            style: Get.textTheme.headlineMedium!.copyWith(
              color: ColorManager.secColor,
            ),
          ),
        ),
        const SizedBox(height: AppSize.s18),
        Column(
          children: List.generate(
            controller.allProperties.length,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: AppPadding.p12),
              child: _buildPropertyCard(controller.allProperties[index]),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPropertyCard(dynamic item) {
    if (item is PropertyRentCard2SmallModel) {
      return GestureDetector(
        onTap: () => Get.toNamed(AppRoutes.propertyDetailsPage),
        child: PropertyRentCard2Small(model: item),
      );
    } else if (item is PropertySaleCard2SmallModel) {
      return GestureDetector(
        onTap: () => Get.toNamed(AppRoutes.propertyDetailsPage),
        child: PropertySaleCard2Small(model: item),
      );
    } else {
      return const SizedBox();
    }
  }
}
