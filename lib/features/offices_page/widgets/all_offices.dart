import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/routes/app_routes.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/data/dto/office_dto.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/features/offices_page/offices_controller.dart';
import 'package:property_ms/features/widgets/error_network_card.dart';
import 'package:property_ms/features/widgets/office_card_style2.dart';
import 'package:shimmer/shimmer.dart';

class AllOffices extends GetView<OfficesController> {
  const AllOffices({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
            child: Text(
              "كل المكاتب",
              style: Get.textTheme.headlineMedium!.copyWith(
                color: ColorManager.secColor,
              ),
            ),
          ),
          const SizedBox(height: AppSize.s18),
          Column(
            children: List.generate(controller.allOfficeList.length, (index) {
              final item = controller.allOfficeList[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: AppPadding.p14,
                ),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.officeDetails, arguments: item);
                  },
                  child: OfficeCardStyle2(model: item),
                ),
              );
            }),
          ),
          controller.loadingAllOfficeState.value == LoadingState.loading
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
                      child: OfficeCardStyle2(
                        model: OfficeDto.empty(),
                        isLoaging: true,
                      ),
                    ),
                  );
                }),
              )
              : Container(),
          controller.loadingAllOfficeState.value == LoadingState.hasError
              ? const ErrorNetworkCard(isSmall: true)
              : Container(),
          const SizedBox(height: AppSize.s16),
        ],
      ),
    );
  }
}
