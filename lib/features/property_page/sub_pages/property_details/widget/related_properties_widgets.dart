import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/Routes/app_routes.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/data/dto/property_dto.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/features/property_page/sub_pages/property_details/property_details_controller.dart';
import 'package:property_ms/features/widgets/property_rent_card.dart';
import 'package:property_ms/features/widgets/property_sale_card.dart';
import 'package:shimmer/shimmer.dart';

class RelatedPropertiesWidgets extends StatelessWidget {
  const RelatedPropertiesWidgets({super.key, required this.controller});

  final PropertyDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppSize.s8),
        Text(
          'عقارات ذات صلة',
          style: Get.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: AppSize.s8),
        SingleChildScrollView(
          controller: controller.scrollTopPropertController,
          scrollDirection: Axis.horizontal,
          child: Obx(
            () => Row(
              children: [
                Row(
                  children: List.generate(controller.topPropertList.length, (
                    index,
                  ) {
                    final item = controller.topPropertList[index];
                    return GestureDetector(
                      onTap:
                          () => Get.toNamed(
                            AppRoutes.propertyDetailsPage,
                            parameters: {"id": item.propertyId.toString()},
                          ),
                      child:
                          item.listingType == "أجار"
                              ? PropertyRentCard(model: item, isLoaging: false)
                              : PropertySaleCard(model: item),
                    );
                  }),
                ),

                controller.loadingTopPropertState.value == LoadingState.loading
                    ? Row(
                      children: List.generate(3, (index) {
                        return Shimmer.fromColors(
                          baseColor: ColorManager.shimmerBaseColor,
                          highlightColor: ColorManager.shimmerHighlightColor,
                          child: PropertyRentCard(
                            model: PropertyDto.empty(),
                            isLoaging: true,
                          ),
                        );
                      }),
                    )
                    : Container(),
              ],
            ),
          ),
        ),
        const SizedBox(height: AppSize.s100),
      ],
    );
  }
}
