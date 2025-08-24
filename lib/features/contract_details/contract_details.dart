import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:property_ms/core/Routes/app_routes.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/data/dto/user_invoice_dto.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/features/contract_details/contract_details_controller.dart';
import 'package:property_ms/features/profile_page/sub_pages/my_sales_page/widgets/sale_card.dart';

import 'package:property_ms/features/reservation_page/widgets/reservation_card.dart';
import 'package:property_ms/features/widgets/empty_card.dart';
import 'package:property_ms/features/widgets/office_profile_reusable_widgets/tab/tab_body.dart';
import 'package:property_ms/features/widgets/office_profile_reusable_widgets/tab/tab_title.dart';
import 'package:shimmer/shimmer.dart';

class ContractDetails extends GetView<ContractDetailsController> {
  const ContractDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ContractDetailsController());
    log(controller.typeContract.value.name);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HearderReservationDetails(),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child:
                controller.typeContract.value == ContractTypes.rentProperty
                    ? GestureDetector(
                      onTap:
                          () => Get.toNamed(
                            AppRoutes.propertyDetailsPage,
                            parameters: {
                              "id":
                                  controller.userReservation.propertyId
                                      .toString(),
                            },
                          ),
                      child: ReservationCard(model: controller.userReservation),
                    )
                    : controller.typeContract.value == ContractTypes.rentToursem
                    ? ReservationCard(model: controller.userReservation)
                    : SaleCard(model: controller.userReservation),
          ),
          TabTitle(
            tabs: controller.tabs,
            tabController: controller.tabController,
          ),

          TabBody(
            tabController: controller.tabController,
            children: [
              RefreshIndicator(
                onRefresh: () async {
                  await controller.refreshPage();
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Obx(
                    () => Column(
                      children: [
                        const SizedBox(height: AppSize.s4),
                        ...List.generate(
                          controller.currentBillList.length,
                          (index) => CurrentBillCard(
                            model: controller.currentBillList[index],
                          ),
                        ),
                        controller.currentBillList.isEmpty &&
                                controller.loadingState.value !=
                                    LoadingState.loading
                            ? const EmptyCard()
                            : Container(),
                        controller.loadingState.value == LoadingState.loading
                            ? Column(
                              children: List.generate(
                                4,
                                (index) => Shimmer.fromColors(
                                  baseColor: ColorManager.shimmerBaseColor,
                                  highlightColor:
                                      ColorManager.shimmerHighlightColor,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: AppPadding.p12,
                                    ),
                                    child: CurrentBillCard(
                                      model: CurrentPurchaseItemDto.empty(),
                                      isLoaging: true,
                                    ),
                                  ),
                                ),
                              ),
                            )
                            : Container(),
                        const SizedBox(height: AppSize.s16),
                      ],
                    ),
                  ),
                ),
              ),
              RefreshIndicator(
                onRefresh: () async {
                  await controller.refreshPage();
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Obx(
                    () => Column(
                      children: [
                        const SizedBox(height: AppSize.s4),
                        ...List.generate(
                          controller.previousBillList.length,
                          (index) => PastBillCard(
                            model: controller.previousBillList[index],
                          ),
                        ),
                        controller.previousBillList.isEmpty &&
                                controller.loadingState.value !=
                                    LoadingState.loading
                            ? const EmptyCard()
                            : Container(),
                        controller.loadingState.value == LoadingState.loading
                            ? Column(
                              children: List.generate(
                                3,
                                (index) => Shimmer.fromColors(
                                  baseColor: ColorManager.shimmerBaseColor,
                                  highlightColor:
                                      ColorManager.shimmerHighlightColor,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: AppPadding.p12,
                                    ),
                                    child: PastBillCard(
                                      model: PurchaseItemDto.empty(),
                                      isLoaging: true,
                                    ),
                                  ),
                                ),
                              ),
                            )
                            : Container(),
                        const SizedBox(height: AppSize.s16),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CurrentBillCard extends GetView<ContractDetailsController> {
  final CurrentPurchaseItemDto model;
  final bool isLoaging;
  const CurrentBillCard({
    super.key,
    required this.model,
    this.isLoaging = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p16,
        vertical: AppPadding.p4,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p16,
          vertical: AppPadding.p16,
        ),
        width: AppSize.sWidth,
        // height: 75,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s16)),

          color: isLoaging ? Colors.transparent : ColorManager.cardBack2,
          border:
              isLoaging
                  ? Border.all()
                  : Border.all(color: ColorManager.primary3Color),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    model.reason,
                    overflow: TextOverflow.ellipsis,
                    style: Get.textTheme.bodyLarge!.copyWith(
                      fontSize: FontSize.s12,
                    ),
                  ),
                  Text(
                    model.deadline,
                    overflow: TextOverflow.ellipsis,
                    style: Get.textTheme.bodyLarge!.copyWith(
                      fontSize: FontSize.s12,
                      color: ColorManager.cardHead,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "المبلغ:",
                    overflow: TextOverflow.ellipsis,
                    style: Get.textTheme.bodyLarge!.copyWith(
                      fontSize: FontSize.s12,
                    ),
                  ),
                  Text(
                    "${model.amount.toStringAsFixed(2)} \$",
                    overflow: TextOverflow.ellipsis,
                    style: Get.textTheme.bodyLarge!.copyWith(
                      fontSize: FontSize.s12,
                      color: ColorManager.cardHead,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "الحالة:",
                    overflow: TextOverflow.ellipsis,
                    style: Get.textTheme.bodyLarge!.copyWith(
                      fontSize: FontSize.s12,
                    ),
                  ),

                  Text(
                    "قيد الإنتظار",
                    overflow: TextOverflow.ellipsis,
                    style: Get.textTheme.bodyLarge!.copyWith(
                      fontSize: FontSize.s12,
                      color: ColorManager.yello,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap:
                  () => controller.mainController.makePayment("clientSecret"),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p16,
                  vertical: AppPadding.p8,
                ),
                decoration: const BoxDecoration(
                  color: ColorManager.primaryDark,
                  borderRadius: BorderRadius.all(Radius.circular(AppSize.s16)),
                ),
                child: Text(
                  "إدفع ",
                  overflow: TextOverflow.ellipsis,
                  style: Get.textTheme.bodyLarge!.copyWith(
                    fontSize: FontSize.s12,
                    color: ColorManager.whiteColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PastBillCard extends StatelessWidget {
  final PurchaseItemDto model;
  final bool isLoaging;
  const PastBillCard({super.key, required this.model, this.isLoaging = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p16,
        vertical: AppPadding.p4,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p16,
          vertical: AppPadding.p16,
        ),
        width: AppSize.sWidth,

        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s16)),
          color: isLoaging ? Colors.transparent : ColorManager.cardBack2,
          border:
              isLoaging
                  ? Border.all()
                  : Border.all(color: ColorManager.primary3Color),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "تاريخ الدفع ",
                        overflow: TextOverflow.ellipsis,
                        style: Get.textTheme.bodyLarge!.copyWith(
                          fontSize: FontSize.s12,
                        ),
                      ),
                      Text(
                        model.date,
                        overflow: TextOverflow.ellipsis,
                        style: Get.textTheme.bodyLarge!.copyWith(
                          fontSize: FontSize.s12,
                          color: ColorManager.cardHead,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "السبب ",
                        overflow: TextOverflow.ellipsis,
                        style: Get.textTheme.bodyLarge!.copyWith(
                          fontSize: FontSize.s12,
                        ),
                      ),
                      Text(
                        model.reason,
                        overflow: TextOverflow.ellipsis,
                        style: Get.textTheme.bodyLarge!.copyWith(
                          fontSize: FontSize.s12,
                          color: ColorManager.cardHead,
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "الحالة:",
                        overflow: TextOverflow.ellipsis,
                        style: Get.textTheme.bodyLarge!.copyWith(
                          fontSize: FontSize.s12,
                        ),
                      ),
                      Text(
                        model.status,
                        overflow: TextOverflow.ellipsis,
                        style: Get.textTheme.bodyLarge!.copyWith(
                          fontSize: FontSize.s12,
                          color: ColorManager.greenColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSize.s16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "المبلغ",
                        overflow: TextOverflow.ellipsis,
                        style: Get.textTheme.bodyLarge!.copyWith(
                          fontSize: FontSize.s12,
                        ),
                      ),
                      Text(
                        "\$${model.amount}",
                        overflow: TextOverflow.ellipsis,
                        style: Get.textTheme.bodyLarge!.copyWith(
                          fontSize: FontSize.s12,
                          color: ColorManager.cardHead,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "نوع الدفع:",
                        overflow: TextOverflow.ellipsis,
                        style: Get.textTheme.bodyLarge!.copyWith(
                          fontSize: FontSize.s12,
                        ),
                      ),
                      Text(
                        model.paymentMethod,
                        overflow: TextOverflow.ellipsis,
                        style: Get.textTheme.bodyLarge!.copyWith(
                          fontSize: FontSize.s12,
                          color: ColorManager.cardHead,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p16,
                    vertical: AppPadding.p8,
                  ),
                  decoration: BoxDecoration(
                    color: ColorManager.primary5Color,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(AppSize.s16),
                    ),
                    border: Border.all(color: ColorManager.primary6Color),
                  ),
                  child: Text(
                    "عرض الفاتورة ",
                    overflow: TextOverflow.ellipsis,
                    style: Get.textTheme.bodyLarge!.copyWith(
                      fontSize: FontSize.s12,
                      color: ColorManager.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HearderReservationDetails extends GetView<ContractDetailsController> {
  const HearderReservationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.sWidth,
      height: AppSize.sHeight * 0.25,
      color: ColorManager.lightPrimaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "السعر",
            overflow: TextOverflow.ellipsis,
            style: Get.textTheme.bodyLarge!.copyWith(fontSize: FontSize.s18),
          ),
          const SizedBox(height: AppSize.s24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                controller.typeContract.value == ContractTypes.sale
                    ? "${controller.userReservation.sellingPrice} \$ "
                    : controller.typeContract.value ==
                        ContractTypes.rentProperty
                    ? "${controller.userReservation.rentalPrice} \$ "
                    : "",
                overflow: TextOverflow.ellipsis,
                style: Get.textTheme.bodyLarge!.copyWith(
                  fontSize: FontSize.s24,
                ),
              ),
              controller.typeContract.value == ContractTypes.rentProperty
                  ? Text(
                    controller.userReservation.rentalPeriod,
                    overflow: TextOverflow.ellipsis,
                    style: Get.textTheme.bodyLarge!.copyWith(
                      fontSize: FontSize.s14,
                    ),
                  )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }
}
