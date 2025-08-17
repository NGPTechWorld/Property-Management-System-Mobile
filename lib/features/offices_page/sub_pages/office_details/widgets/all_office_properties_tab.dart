import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/Routes/app_routes.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/data/dto/property_dto.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/features/widgets/card_filter.dart';
import 'package:property_ms/features/widgets/property_rent_card2_small.dart';
import 'package:property_ms/features/widgets/property_sale_card2_small.dart';
import 'package:shimmer/shimmer.dart';
import '../office_details_controller.dart';

class AllOfficePropertiesTab extends GetView<OfficeDetailsController> {
  const AllOfficePropertiesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RefreshIndicator(
        onRefresh: () async {
          await controller.refreshOfficeProprty();
        },
        child: SingleChildScrollView(
          controller: controller.scrollAllPropertController,
          child: Column(
            children: [
              const SizedBox(height: AppSize.s16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: List.generate(
                    cardFilterDefault.length,
                    (index) => GestureDetector(
                      onTap: () {
                        controller.selectFilter(index);
                      },
                      child: CardFilter(
                        model: cardFilterDefault[index],
                        isSelect: controller.selectedFilterIndex.value == index,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSize.s16),

              Column(
                children: List.generate(
                  controller.allPropertList.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: AppPadding.p12),
                    child: _buildPropertyCard(controller.allPropertList[index]),
                  ),
                ),
              ),
              controller.loadingAllPropertState.value == LoadingState.loading
                  ? Column(
                    children: List.generate(3, (index) {
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
              const SizedBox(height: AppSize.s8),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPropertyCard(PropertyDto item) {
    if (item.type == "عقاري") {
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
    } else {
      return const SizedBox();
    }
  }
}
