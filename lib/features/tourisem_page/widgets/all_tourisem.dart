import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/routes/app_routes.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/data/dto/tourism_dto.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/features/tourisem_page/tourisem_controller.dart';
import 'package:property_ms/features/widgets/tourisem_card_small.dart';
import 'package:shimmer/shimmer.dart';

class AllTourisem extends GetView<TourisemController> {
  const AllTourisem({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
            child: Text(
              "كل الأماكن السياحية",
              style: Get.textTheme.headlineMedium!.copyWith(
                color: ColorManager.secColor,
              ),
            ),
          ),
          const SizedBox(height: AppSize.s18),
          Column(
            children: List.generate(
              controller.allTourismList.length,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: AppPadding.p12),
                child: GestureDetector(
                  onTap:
                      () => Get.toNamed(
                        AppRoutes.tourismDetailsPage,
                        parameters: {
                          'id':
                              controller.allTourismList[index].propertyId
                                  .toString(),
                        },
                      ),
                  child: TourisemCardSmall(
                    model: controller.allTourismList[index],
                  ),
                ),
              ),
            ),
          ),
          controller.loadingAllTourismState.value == LoadingState.loading
              ? Column(
                children: List.generate(2, (index) {
                  return Shimmer.fromColors(
                    baseColor: ColorManager.shimmerBaseColor,
                    highlightColor: ColorManager.shimmerHighlightColor,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: AppPadding.p12),
                      child: TourisemCardSmall(
                        model: TourismDto.empty(),
                        isLoading: true,
                      ),
                    ),
                  );
                }),
              )
              : Container(),
        ],
      ),
    );
  }
}
