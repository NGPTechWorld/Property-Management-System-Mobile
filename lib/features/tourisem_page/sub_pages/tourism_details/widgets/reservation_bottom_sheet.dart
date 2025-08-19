import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/widgets/app_button.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/features/tourisem_page/sub_pages/tourism_details/tourism_details_controller.dart';

class ReservationBottomSheet {
  static show() async {
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
              horizontal: AppPadding.p16,
              vertical: AppPadding.p16,
            ),
            child: SingleChildScrollView(
              // 🔥 هون أضفت Scroll
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ===== Header =====
                  Row(
                    children: [
                      CircleAvatar(
                        radius: AppSize.s18,
                        backgroundColor: ColorManager.greyColor100,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          iconSize: AppSize.s18,
                          onPressed: () => Get.back(),
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
                            "إحجز الآن",
                            style: Get.textTheme.headlineSmall!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: ColorManager.primary7Color,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(color: ColorManager.primary3Color),
                  const SizedBox(height: AppSize.s16),

                  // ===== Days Allowed =====
                  Obx(
                    () => Text(
                      "عدد الأيام المتاح حجزها : ${controller.allowedDays.value}  ",
                      style: Get.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: ColorManager.primary7Color,
                      ),
                    ),
                  ),

                  const SizedBox(height: AppSize.s16),

                  // ===== Calendar Wrap =====
                  Obx(() {
                    if (controller.loadingReservaion.value ==
                        LoadingState.loading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    return Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: List.generate(
                        controller.celenderReservaion.length,
                        (index) {
                          final day = controller.celenderReservaion[index];
                          return GestureDetector(
                            onTap:
                                day.isReseved
                                    ? null
                                    : () => controller.toggleDaySelection(day),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              width: AppSize.sWidth / 6,
                              height: 80,
                              decoration: BoxDecoration(
                                color:
                                    day.isReseved
                                        ? ColorManager.greyColor100
                                        : day.isSelect.value
                                        ? ColorManager.primaryDark
                                        : ColorManager.cardBackground,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color:
                                      day.isReseved
                                          ? Colors.grey
                                          : day.isSelect.value
                                          ? ColorManager.primaryDark
                                          : ColorManager.primary3Color,
                                  width: 2,
                                ),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      day.day,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            day.isReseved
                                                ? Colors.grey
                                                : day.isSelect.value
                                                ? Colors.white
                                                : Colors.black,
                                      ),
                                    ),
                                    Text(
                                      day.numDay,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            day.isReseved
                                                ? Colors.grey
                                                : day.isSelect.value
                                                ? Colors.white
                                                : Colors.black,
                                      ),
                                    ),
                                    Text(
                                      day.month,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color:
                                            day.isReseved
                                                ? Colors.grey
                                                : day.isSelect.value
                                                ? Colors.white
                                                : Colors.black,
                                      ),
                                    ),
                                    if (day.isReseved)
                                      const Icon(
                                        Icons.lock,
                                        size: 16,
                                        color: Colors.grey,
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }),

                  const SizedBox(height: AppSize.s16),

                  // ===== Prices =====
                  Obx(() {
                    double totalDayPrice =
                        controller.tourismDetails!.price *
                        controller.selectedDaysCount.value;
                    double officePrice =
                        totalDayPrice * controller.officeNaspeh;
                    double totalPrice = officePrice + totalDayPrice;

                    return Column(
                      spacing: 8,
                      children: [
                        LabelRecevation(
                          title: "عدد الأيام المختارة:",
                          value: controller.selectedDaysCount.value.toString(),
                        ),
                        LabelRecevation(
                          title: "سعر اليوم:",
                          value:
                              "${controller.tourismDetails!.price.toStringAsFixed(2)} \$",
                        ),
                        LabelRecevation(
                          title: "السعر بالأيام:",
                          value: "${totalDayPrice.toStringAsFixed(2)} \$",
                        ),
                        LabelRecevation(
                          title: "عمولة المكتب:",
                          value: "${officePrice.toStringAsFixed(2)} \$",
                        ),
                        LabelRecevation(
                          title: "السعر الإجمالي:",
                          value: "${totalPrice.toStringAsFixed(2)} \$",
                        ),
                      ],
                    );
                  }),

                  const SizedBox(height: AppSize.s16),

                  Text(
                    "إدفع الفاتورة التالية:",
                    style: Get.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: ColorManager.primary7Color,
                    ),
                  ),
                  const SizedBox(height: AppSize.s16),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ColorManager.primary2Color,
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Text(
                          "العربون",
                          style: Get.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: ColorManager.primaryDark,
                          ),
                        ),
                        Expanded(
                          child: Obx(
                            () => Center(
                              child: Text(
                                "${(controller.arbonNaspeh * controller.totalPrice.value).toStringAsFixed(2)} \$",
                                style: Get.textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.primaryDark,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: AppSize.s24),

                  Obx(
                    () => AppButton(
                      text: "إدفع العربون",
                      enabled: controller.selectedDaysCount.value >= 1,

                      backgroundColor:
                          controller.selectedDaysCount.value >= 1
                              ? ColorManager.primaryDark
                              : ColorManager.grey2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class LabelRecevation extends StatelessWidget {
  const LabelRecevation({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: Get.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: Get.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: ColorManager.cardHead,
            ),
          ),
        ),
      ],
    );
  }
}
