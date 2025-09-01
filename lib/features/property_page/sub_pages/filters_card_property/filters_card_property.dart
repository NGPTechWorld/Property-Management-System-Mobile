import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:property_ms/core/Routes/app_routes.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/normal_app_bar.dart';
import 'package:property_ms/data/dto/property_dto.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/features/property_page/sub_pages/filters_card_property/filters_card_property_controller.dart';
import 'package:property_ms/features/widgets/empty_card.dart';
import 'package:property_ms/features/widgets/property_rent_card2_small.dart';
import 'package:property_ms/features/widgets/property_sale_card2_small.dart';
import 'package:shimmer/shimmer.dart';

class FiltersCardProperty extends GetView<FiltersCardPropertyController> {
  const FiltersCardProperty({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FiltersCardPropertyController());
    return Scaffold(
      appBar: const NormalAppBar(title: "نتائج الفلترة"),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: AppSize.s8),
            Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p14,
                    ),
                    child: Text(
                      "كل العقارات",
                      style: Get.textTheme.headlineMedium!.copyWith(
                        color: ColorManager.secColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSize.s18),
                  controller.loadingAllPropertState.value !=
                              LoadingState.loading &&
                          controller.allPropertList.isEmpty
                      ? const EmptyCard()
                      : Container(),
                  Column(
                    children: List.generate(
                      controller.allPropertList.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(bottom: AppPadding.p12),
                        child: _buildPropertyCard(
                          controller.allPropertList[index],
                        ),
                      ),
                    ),
                  ),
                  controller.loadingAllPropertState.value ==
                          LoadingState.loading
                      ? Column(
                        children: List.generate(2, (index) {
                          return Shimmer.fromColors(
                            baseColor: ColorManager.shimmerBaseColor,
                            highlightColor: ColorManager.shimmerHighlightColor,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                bottom: AppPadding.p12,
                              ),
                              child: PropertyRentCard2Small(
                                model: PropertyDto.empty(),
                                isLoaging: true,
                              ),
                            ),
                          );
                        }),
                      )
                      : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPropertyCard(PropertyDto item) {
    if (item.listingType == "أجار") {
      return GestureDetector(
        onTap:
            () => Get.toNamed(
              AppRoutes.propertyDetailsPage,
              parameters: {"id": item.propertyId.toString()},
            ),
        child: PropertyRentCard2Small(model: item),
      );
    } else if (item.listingType == "بيع") {
      return GestureDetector(
        onTap:
            () => Get.toNamed(
              AppRoutes.propertyDetailsPage,
              parameters: {"id": item.propertyId.toString()},
            ),
        child: PropertySaleCard2Small(model: item),
      );
    } else {
      return const SizedBox();
    }
  }
}
