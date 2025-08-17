import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/normal_app_bar.dart';
import 'package:property_ms/data/dto/user_purchases_dto.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/features/notification_page/notification_controller.dart';
import 'package:property_ms/features/notification_page/widgets/notification_card.dart';
import 'package:property_ms/features/profile_page/sub_pages/my_sales_page/widgets/sale_card.dart';
import 'package:property_ms/features/widgets/empty_card.dart';
import 'package:shimmer/shimmer.dart';

class NotificationPage extends GetView<NotificationController> {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NormalAppBar(title: "الإشعارات", isNotifications: false),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSize.s8),
              Obx(
                () => Column(
                  children: [
                    Column(
                      children: List.generate(
                        controller.notificationsList.length,
                        (index) => NotificationCard(
                          model: controller.notificationsList[index],
                        ),
                      ),
                    ),
                    controller.loadingState.value == LoadingState.doneWithNoData
                        ? const EmptyCard()
                        : Container(),
                    controller.loadingState.value == LoadingState.loading
                        ? Column(
                          children: List.generate(2, (index) {
                            return Shimmer.fromColors(
                              baseColor: ColorManager.shimmerBaseColor,
                              highlightColor:
                                  ColorManager.shimmerHighlightColor,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: AppPadding.p12,
                                ),
                                child: SaleCard(
                                  model: UserPurchasesDto.empty(),
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
            ],
          ),
        ),
      ),
    );
  }
}
