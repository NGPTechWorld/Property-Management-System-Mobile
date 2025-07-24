import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/data/dto/rent_dto.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/features/home_page/home_controller.dart';
import 'package:property_ms/features/widgets/property_rent_card.dart';
import 'package:shimmer/shimmer.dart';

class TopPropertyHome extends GetView<HomeController> {
  const TopPropertyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
          child: Text(
            "عقارات مميزة",
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
                  children: List.generate(controller.topPropertList.length, (
                    index,
                  ) {
                    final item = controller.topPropertList[index];
                    return PropertyRentCard(model: item, isLoaging: false);
                  }),
                ),
                controller.loadingTopPropertState.value == LoadingState.loading
                    ? Row(
                      children: List.generate(3, (index) {
                        return Shimmer.fromColors(
                          baseColor: ColorManager.shimmerBaseColor,
                          highlightColor: ColorManager.shimmerHighlightColor,
                          child: PropertyRentCard(
                            model: RentCardDto.empty(),
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
    );
  }
}
