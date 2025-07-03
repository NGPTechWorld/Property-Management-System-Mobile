import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/features/offices_page/offices_controller.dart';

class AdsSliderWidget extends GetView<OfficesController> {
  const AdsSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppSize.s8),
      child: Column(
        children: [
          CarouselSlider(
            items:
                controller.adsSliderImages
                    .map((e) => AdsCard(imagePath: e))
                    .toList(),
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
          SizedBox(height: AppSize.s4),

          Obx(() {
            final adsLength = controller.adsSliderImages.length;
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

class AdsCard extends StatelessWidget {
  final String imagePath;

  const AdsCard({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CachedNetworkImage(
          imageUrl: imagePath,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}
