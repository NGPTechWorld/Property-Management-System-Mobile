import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/routes/app_routes.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/data/dto/tourism_dto.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/features/tourisem_page/sub_pages/tourism_details/tourism_details_controller.dart';
import 'package:property_ms/features/widgets/tourisem_card_small.dart';
import 'package:shimmer/shimmer.dart';

class SelectTourismBottomSheet {
  static showAnswer() async {
    final controller = Get.find<TourismDetailsController>();

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
              horizontal: AppPadding.p8,
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
                          "اختر المكان السياحي",
                          style: Get.textTheme.headlineSmall!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSize.s16),

                // Tourism List
                Expanded(
                  child: Obx(() {
                    return ListView.builder(
                      controller: controller.scrollAllPropertController,
                      itemCount:
                          controller.allTourismList.length +
                          (controller.loadingAllTourismState.value ==
                                  LoadingState.loading
                              ? 2
                              : 0),
                      itemBuilder: (context, index) {
                        if (index < controller.allTourismList.length) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              bottom: AppPadding.p12,
                            ),
                            child: GestureDetector(
                              onTap:
                                  () => Get.toNamed(
                                    AppRoutes.compareTourismPage,
                                    parameters: {
                                      "id1":
                                          controller.tourismDetails!.propertyId
                                              .toString(),
                                      "id2":
                                          controller
                                              .allTourismList[index]
                                              .propertyId
                                              .toString(),
                                    },
                                  ),
                              child: TourisemCardSmall(
                                model: controller.allTourismList[index],
                              ),
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
                              child: TourisemCardSmall(
                                model: TourismDto.empty(),
                                isLoading: true,
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
}
