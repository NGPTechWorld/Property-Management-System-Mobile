import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/normal_app_bar.dart';
import 'reservation_controller.dart';

class ReservationPage extends GetView<ReservationController> {
  const ReservationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ReservationController());
    return Scaffold(
      appBar: const NormalAppBar(title: "الحجوزات"),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectTypeReservation(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Container(
                width: AppSize.sWidth * 0.99,
                height: AppSize.sHeight * 0.18,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(width: 8),

                    // Image + tag + favIcon
                    Stack(
                      children: [
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Assets.images.property.image(
                              height: AppSize.sHeight * 0.12,
                              width: AppSize.sWidth * 0.33,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 4,
                          ),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: ColorManager.primaryColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'للإيجار',
                                style: Get.textTheme.bodySmall!.copyWith(
                                  color: ColorManager.whiteColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          const SizedBox(height: AppSize.s4),
                          SizedBox(
                            width: AppSize.sWidth * .30,
                            child: Text(
                              " العنوان",
                              style: Get.textTheme.bodyLarge!.copyWith(
                                fontSize: FontSize.s14,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: ColorManager.primary5Color,
                                size: 18,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "دمشق , ميدان",
                                overflow: TextOverflow.ellipsis,
                                style: Get.textTheme.bodyLarge!.copyWith(
                                  fontSize: FontSize.s12,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Assets.icons.target.svg(
                                // ignore: deprecated_member_use_from_same_package
                                color: ColorManager.primary5Color,
                                width: 18,
                              ),

                              const SizedBox(width: 4),
                              Text(
                                "الحالة : ",
                                overflow: TextOverflow.ellipsis,
                                style: Get.textTheme.bodyLarge!.copyWith(
                                  fontSize: FontSize.s12,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "مؤجر",
                                overflow: TextOverflow.ellipsis,
                                style: Get.textTheme.bodyLarge!.copyWith(
                                  fontSize: FontSize.s12,
                                  color: ColorManager.greenColor,
                                ),
                              ),
                            ],
                          ),
                          // const SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                "تاريخ البداية:  ",
                                style: Get.textTheme.bodyLarge!.copyWith(
                                  fontSize: FontSize.s12,
                                ),
                              ),
                              Text(
                                '2025-05-20',
                                style: Get.textTheme.bodyMedium!.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "تاريخ النهاية:  ",
                                style: Get.textTheme.bodyLarge!.copyWith(
                                  fontSize: FontSize.s12,
                                ),
                              ),
                              Text(
                                '2025-12-20',
                                style: Get.textTheme.bodyMedium!.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const Spacer(),

                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorManager.primaryDark.withAlpha(20),
                      ),
                      child: Assets.icons.arrowPrevSmall.svg(
                        colorFilter: const ColorFilter.mode(
                          ColorManager.primaryDark,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectTypeReservation extends GetView<ReservationController> {
  const SelectTypeReservation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorManager.whiteColor,
        border: Border(
          bottom: BorderSide(color: ColorManager.grey, width: 1.5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children:
              controller.navButtons.entries
                  .map(
                    (item) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Obx(() {
                          final key = controller.navButtons.keys
                              .toList()
                              .indexOf(item.key);
                          return OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              minimumSize: const Size(30, 45),
                              backgroundColor:
                                  controller.pageIndex.value == key
                                      ? ColorManager.primaryDark
                                      : null,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              side: const BorderSide(
                                color: ColorManager.grey,
                                width: 1.5,
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: AppSize.sWidth * 0.04,
                              ),
                            ),
                            onPressed: () {
                              controller.selectTabScreen(key);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 8,
                              children: [
                                item.value.svg(
                                  colorFilter: ColorFilter.mode(
                                    controller.pageIndex.value == key
                                        ? ColorManager.whiteColor
                                        : ColorManager.blackColor,
                                    BlendMode.srcIn,
                                  ),
                                  width: AppSize.sWidth * 0.053,
                                ),
                                Text(
                                  item.key.tr,
                                  style: TextStyle(
                                    fontSize: FontSize.s13,
                                    color:
                                        controller.pageIndex.value == key
                                            ? ColorManager.whiteColor
                                            : ColorManager.blackColor,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  )
                  .toList(),
        ),
      ),
    );
  }
}
