import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/features/property_page/property_controller.dart';
import 'package:property_ms/features/widgets/property_sale_card.dart';

class PropertySliderWidget extends GetView<PropertyController> {
  const PropertySliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppSize.s8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
            child: Text(
              "عقارات مميزة",
              style: Get.textTheme.headlineMedium!.copyWith(
                color: ColorManager.secColor,
              ),
            ),
          ),
          const SizedBox(height: AppSize.s18),
          CarouselSlider(
            items: List.generate(controller.propertySlider.length, (index) {
              final item = controller.propertySlider[index];

              return PropertySaleCard(model: item);
                        }),
            options: CarouselOptions(
              height: AppSize.sHeight * 0.21,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              autoPlay: true,
              onPageChanged: (index, reason) {
                controller.sliderIndex.value = index;
              },
            ),
          ),
          const SizedBox(height: AppSize.s4),

          Obx(() {
            final adsLength = controller.propertySlider.length;
            final displayCount = min(adsLength, 3);

            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(displayCount, (index) {
                int visibleIndex =
                    adsLength > 3
                        ? (controller.sliderIndex.value % adsLength) % 3
                        : index;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: visibleIndex == index ? 23 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color:
                        visibleIndex == index
                            ? ColorManager.secColor
                            : ColorManager.grey3,
                    borderRadius: BorderRadius.circular(8),
                  ),
                );
              }),
            );
          }),
        ],
      ),
    );
  }
}
