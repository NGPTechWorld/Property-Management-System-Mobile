import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/routes/app_routes.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/data/dto/office_dto.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/features/offices_page/offices_controller.dart';
import 'package:property_ms/features/widgets/office_card.dart';
import 'package:shimmer/shimmer.dart';

class TopOffices extends StatelessWidget {
  const TopOffices({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OfficesController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
          child: Text(
            "أفضل المكاتب",
            style: Get.textTheme.headlineMedium!.copyWith(
              color: ColorManager.secColor,
            ),
          ),
        ),
        const SizedBox(height: AppSize.s18),
        SingleChildScrollView(
          controller: controller.scrollTopOfficeController,
          scrollDirection: Axis.horizontal,
          child: Obx(
            () => Row(
              children: [
                Row(
                  children: List.generate(controller.topOfficeList.length, (
                    index,
                  ) {
                    final item = controller.topOfficeList[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p6,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.officeDetails, arguments: item);
                        },
                        child: OfficeCard(model: item),
                      ),
                    );
                  }),
                ),
                controller.loadingTopOfficeState.value == LoadingState.loading
                    ? Row(
                      children: List.generate(3, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p6,
                          ),
                          child: Shimmer.fromColors(
                            baseColor: ColorManager.shimmerBaseColor,
                            highlightColor: ColorManager.shimmerHighlightColor,
                            child: OfficeCard(
                              model: OfficeDto.empty(),
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
