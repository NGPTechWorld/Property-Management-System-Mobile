import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/routes/app_routes.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/data/dto/user_reservation_dto.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/features/contract_details/contract_details_controller.dart';
import 'package:property_ms/features/reservation_page/reservation_controller.dart';
import 'package:property_ms/features/reservation_page/widgets/reservation_card.dart';
import 'package:property_ms/features/widgets/empty_card.dart';
import 'package:shimmer/shimmer.dart';

class TourisemReservation extends GetView<ReservationController> {
  const TourisemReservation({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await controller.refreshPageTourisem();
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        controller: controller.scrollUserReservationTourisemController,
        child: Obx(
          () => Column(
            children: [
              Column(
                children: List.generate(
                  controller.userReservationTourisemList.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: AppPadding.p12),
                    child: GestureDetector(
                      onTap:
                          () => Get.toNamed(
                            AppRoutes.contractDetailsRoute,
                            parameters: {
                              "typeContract": ContractTypes.rentProperty.name,
                            },
                          ),
                      child: ReservationCard(
                        model: controller.userReservationTourisemList[index],
                      ),
                    ),
                  ),
                ),
              ),
              controller.loadingUserReservationTourisemState.value ==
                      LoadingState.doneWithNoData
                  ? const EmptyCard()
                  : Container(),
              controller.loadingUserReservationTourisemState.value ==
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
                          child: ReservationCard(
                            model: UserReservationDto.empty(),
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
    );
  }
}
