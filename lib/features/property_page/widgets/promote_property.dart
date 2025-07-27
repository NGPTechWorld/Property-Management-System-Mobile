import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/Routes/app_routes.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/data/dto/property_dto.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/features/property_page/property_controller.dart';
import 'package:property_ms/features/widgets/property_rent_card.dart';
import 'package:property_ms/features/widgets/property_sale_card.dart';
import 'package:shimmer/shimmer.dart';

class PromoteProperty extends GetView<PropertyController> {
  const PromoteProperty({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () =>
          !controller.isSearch.value &&
                  controller.selectedFilterIndex.value == 0
              ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p14,
                    ),
                    child: Text(
                      "العقارات الرائجة",
                      style: Get.textTheme.headlineMedium!.copyWith(
                        color: ColorManager.secColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSize.s18),
                  SingleChildScrollView(
                    controller: controller.scrollTopPropertController,
                    scrollDirection: Axis.horizontal,
                    child: Obx(
                      () => Row(
                        children: [
                          Row(
                            children: List.generate(
                              controller.topPropertList.length,
                              (index) {
                                final item = controller.topPropertList[index];
                                return GestureDetector(
                                  onTap:
                                      () => Get.toNamed(
                                        AppRoutes.propertyDetailsPage,
                                        parameters: {
                                          "id": item.propertyId.toString(),
                                        },
                                      ),
                                  child:
                                      item.listingType == "أجار"
                                          ? PropertyRentCard(
                                            model: item,
                                            isLoaging: false,
                                          )
                                          : PropertySaleCard(model: item),
                                );
                              },
                            ),
                          ),
                          controller.loadingTopPropertState.value ==
                                  LoadingState.loading
                              ? Row(
                                children: List.generate(3, (index) {
                                  return Shimmer.fromColors(
                                    baseColor: ColorManager.shimmerBaseColor,
                                    highlightColor:
                                        ColorManager.shimmerHighlightColor,
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
                  const SizedBox(height: AppSize.s16),
                ],
              )
              : Container(),
    );
  }
}
