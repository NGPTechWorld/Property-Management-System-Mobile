import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/data/dto/service_dto.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/features/services_page/services_controller.dart';
import 'package:property_ms/features/widgets/top_services_card.dart';
import 'package:shimmer/shimmer.dart';

class TopServices extends StatelessWidget {
  const TopServices({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ServicesController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
          child: Text(
            "أفضل الخدمات",
            style: Get.textTheme.headlineMedium!.copyWith(
              color: ColorManager.secColor,
            ),
          ),
        ),
        const SizedBox(height: AppSize.s18),
        SingleChildScrollView(
          controller: controller.scrollTopServiceController,
          scrollDirection: Axis.horizontal,
          child: Obx(
            () => Row(
              children: [
                Row(
                  children: List.generate(controller.topServiceList.length, (
                    index,
                  ) {
                    final item = controller.topServiceList[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: TopServicesCard(model: item),
                    );
                  }),
                ),
                controller.loadingTopServiceState.value == LoadingState.loading
                    ? Row(
                      children: List.generate(3, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Shimmer.fromColors(
                            baseColor: ColorManager.shimmerBaseColor,
                            highlightColor: ColorManager.shimmerHighlightColor,
                            child: TopServicesCard(
                              model: ServiceDto.empty(),
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
        ),
        const SizedBox(height: AppSize.s16),
      ],
    );
  }
}
