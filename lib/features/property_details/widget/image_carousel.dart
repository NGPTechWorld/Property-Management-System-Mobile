import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/features/property_details/property_details_controller.dart';

class ImageCarousel extends StatelessWidget {
  final PropertyDetailsController controller;
  final double height;

  const ImageCarousel({super.key, required this.controller, this.height = 300});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: height,
            viewportFraction: 1.0,
            autoPlay: true,
            onPageChanged: (index, reason) {
              controller.sliderIndex.value = index;
            },
          ),
          items:
              controller.images.map((asset) {
                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: asset.provider(),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
        ),
        Positioned(
          bottom: AppSize.s16,
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                controller.images.length,
                (index) => Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        controller.sliderIndex.value == index
                            ? ColorManager.primaryColor
                            : ColorManager.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
