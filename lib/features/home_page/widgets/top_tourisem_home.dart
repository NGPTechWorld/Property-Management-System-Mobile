import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/data/dto/property_dto.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/features/home_page/home_controller.dart';
import 'package:property_ms/features/widgets/error_network_card.dart';
import 'package:property_ms/features/widgets/property_rent_card.dart';
import 'package:shimmer/shimmer.dart';

class TopTourisemHome extends GetView<HomeController> {
  const TopTourisemHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
            child: Text(
              "أماكن سياحية مميزة",
              style: Get.textTheme.headlineMedium!.copyWith(
                color: ColorManager.secColor,
              ),
            ),
          ),
          const SizedBox(height: AppSize.s18),
          SingleChildScrollView(
            controller: controller.scrollTopTourisemController,
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Row(
                  children: List.generate(controller.topTourisemList.length, (
                    index,
                  ) {
                    final item = controller.topTourisemList[index];
                    return PropertyRentCard(model: item, isLoaging: false);
                  }),
                ),
                controller.loadingTopTourisemState.value == LoadingState.loading
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
          controller.loadingTopTourisemState.value == LoadingState.hasError
              ? const ErrorNetworkCard(isSmall: true)
              : Container(),
          const SizedBox(height: AppSize.s16),
        ],
      ),
    );
  }
}
