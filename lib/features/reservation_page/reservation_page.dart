import 'package:get/get.dart';
import 'package:flutter/material.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SelectTypeReservation(),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (pageIndex) {
                controller.pageIndex.value = pageIndex;
              },
              controller: controller.pageController,
              children: controller.pages,
            ),
          ),
        ],
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
