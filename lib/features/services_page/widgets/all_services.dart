import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/routes/app_routes.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/data/dto/service_dto.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/features/services_page/services_controller.dart';
import 'package:property_ms/features/services_page/widgets/service_card_style2.dart';
import 'package:shimmer/shimmer.dart';

class AllServices extends GetView<ServicesController> {
  const AllServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
            child: Text(
              "كل المزودين",
              style: Get.textTheme.headlineMedium!.copyWith(
                color: ColorManager.secColor,
              ),
            ),
          ),
          const SizedBox(height: AppSize.s18),
          Column(
            children: List.generate(controller.allServiceList.length, (index) {
              final item = controller.allServiceList[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: AppPadding.p14,
                ),
                child: GestureDetector(
                  onTap:
                      () => Get.toNamed(
                        AppRoutes.serviceDetails,
                        parameters: {"id": item.id.toString()},
                      ),
                  child: ServiceCardStyle2(model: item),
                ),
              );
            }),
          ),
          controller.loadingAllServiceState.value == LoadingState.loading
              ? Column(
                children: List.generate(2, (index) {
                  return Shimmer.fromColors(
                    baseColor: ColorManager.shimmerBaseColor,
                    highlightColor: ColorManager.shimmerHighlightColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: AppPadding.p14,
                      ),
                      child: ServiceCardStyle2(
                        model: ServiceDto.empty(),
                        isLoaging: true,
                      ),
                    ),
                  );
                }),
              )
              : Container(),
          const SizedBox(height: AppSize.s16),
        ],
      ),
    );
  }
}
