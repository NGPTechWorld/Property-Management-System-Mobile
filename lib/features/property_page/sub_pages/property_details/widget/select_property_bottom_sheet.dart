import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/routes/app_routes.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/data/dto/property_dto.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/features/property_page/sub_pages/property_details/property_details_controller.dart';
import 'package:property_ms/features/widgets/property_rent_card2_small.dart';
import 'package:property_ms/features/widgets/property_sale_card2_small.dart';
import 'package:shimmer/shimmer.dart';

class SelectPropertyBottomSheet {
  static showAnswer() async {
    final controller = Get.find<PropertyDetailsController>();

    return showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      backgroundColor: ColorManager.cardBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.85,
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p16,
              vertical: AppPadding.p16,
            ),
            child: Column(
              children: [
                // Header
                Row(
                  children: [
                    CircleAvatar(
                      radius: AppSize.s18,
                      backgroundColor: ColorManager.greyColor100,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        iconSize: AppSize.s18,
                        onPressed: () {
                          Get.back();
                        },
                        icon: Assets.icons.cancelIcon.svg(
                          colorFilter: const ColorFilter.mode(
                            ColorManager.blackColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "اختر العقار",
                          style: Get.textTheme.headlineSmall!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSize.s16),

                // Property List
                Expanded(
                  child: Obx(() {
                    return ListView.builder(
                      controller: controller.scrollAllPropertController,
                      itemCount:
                          controller.allPropertList.length +
                          (controller.loadingAllPropertState.value ==
                                  LoadingState.loading
                              ? 2
                              : 0),
                      itemBuilder: (context, index) {
                        if (index < controller.allPropertList.length) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              bottom: AppPadding.p12,
                            ),
                            child: _buildPropertyCard(
                              controller.allPropertList[index],
                              controller.propertyDetails!.propertyId,
                            ),
                          );
                        } else {
                          // Loading shimmer while paginating
                          return Padding(
                            padding: const EdgeInsets.only(
                              bottom: AppPadding.p12,
                            ),
                            child: Shimmer.fromColors(
                              baseColor: ColorManager.shimmerBaseColor,
                              highlightColor:
                                  ColorManager.shimmerHighlightColor,
                              child: PropertyRentCard2Small(
                                model: PropertyDto.empty(),
                                isLoaging: true,
                              ),
                            ),
                          );
                        }
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Widget _buildPropertyCard(PropertyDto item, int id1) {
    if (item.listingType == "أجار") {
      return GestureDetector(
        onTap:
            () => Get.toNamed(
              AppRoutes.comparePropertiesPage,
              parameters: {
                "id1": id1.toString(),
                "id2": item.propertyId.toString(),
              },
            ),
        child: PropertyRentCard2Small(model: item),
      );
    } else if (item.listingType == "بيع") {
      return GestureDetector(
        onTap:
            () => Get.toNamed(
              AppRoutes.comparePropertiesPage,
              parameters: {
                "id1": id1.toString(),
                "id2": item.propertyId.toString(),
              },
            ),
        child: PropertySaleCard2Small(model: item),
      );
    } else {
      return const SizedBox();
    }
  }
}
