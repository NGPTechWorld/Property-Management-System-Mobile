import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/features/reservation_page/sub_pages/reservation_details/reservation_details_controller.dart';
import 'package:property_ms/features/reservation_page/widgets/reservation_card.dart';
import 'package:property_ms/features/widgets/office_profile_reusable_widgets/tab/tab_body.dart';
import 'package:property_ms/features/widgets/office_profile_reusable_widgets/tab/tab_title.dart';

class ReservationDetails extends GetView<ReservationDetailsController> {
  const ReservationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ReservationDetailsController());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HearderReservationDetails(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ReservationCard(
              model: ReservationCardModel(
                title: "بيت 200م",
                location: "دمشق , ميدان",
                endDate: '2025-12-20',
                startDate: '2025-05-20',
                image: "image",
                state: "مؤجر",
                type: "إيجار",
              ),
            ),
          ),
          TabTitle(
            tabs: controller.tabs,
            tabController: controller.tabController,
          ),

          TabBody(
            tabController: controller.tabController,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: AppSize.s4),
                    ...List.generate(5, (index) => const CurrentBillCard()),
                    const SizedBox(height: AppSize.s16),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: AppSize.s4),
                    ...List.generate(5, (index) => const PastBillCard()),
                    const SizedBox(height: AppSize.s16),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CurrentBillCard extends StatelessWidget {
  const CurrentBillCard({super.key});

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
          color: ColorManager.cardBack2,
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s16)),
          border: Border.all(color: ColorManager.primary3Color),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "الشهر "
                    "1",
                    overflow: TextOverflow.ellipsis,
                    style: Get.textTheme.bodyLarge!.copyWith(
                      fontSize: FontSize.s12,
                    ),
                  ),
                  Text(
                    "2025-05-20",
                    overflow: TextOverflow.ellipsis,
                    style: Get.textTheme.bodyLarge!.copyWith(
                      fontSize: FontSize.s12,
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
            Container(
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
          ],
        ),
      ),
    );
  }
}

class PastBillCard extends StatelessWidget {
  const PastBillCard({super.key});

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
          color: ColorManager.cardBack2,
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s16)),
          border: Border.all(color: ColorManager.primary3Color),
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
                        "الشهر "
                        "1",
                        overflow: TextOverflow.ellipsis,
                        style: Get.textTheme.bodyLarge!.copyWith(
                          fontSize: FontSize.s12,
                        ),
                      ),
                      Text(
                        "2025-05-20",
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
                        "تم الدفع",
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
                        "تاريخ الدفع ",
                        overflow: TextOverflow.ellipsis,
                        style: Get.textTheme.bodyLarge!.copyWith(
                          fontSize: FontSize.s12,
                        ),
                      ),
                      Text(
                        "2025-05-20",
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
                        "الكتروني",
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

class HearderReservationDetails extends StatelessWidget {
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
                "250"
                " \$ ",
                overflow: TextOverflow.ellipsis,
                style: Get.textTheme.bodyLarge!.copyWith(
                  fontSize: FontSize.s24,
                ),
              ),
              Text(
                "شهرياً",
                overflow: TextOverflow.ellipsis,
                style: Get.textTheme.bodyLarge!.copyWith(
                  fontSize: FontSize.s14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
