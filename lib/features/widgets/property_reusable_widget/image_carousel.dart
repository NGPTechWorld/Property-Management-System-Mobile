import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageCarousel extends StatelessWidget {
  final List<ImageProvider> images;
  final double height;
  final RxInt? currentIndex;
  final Color activeDotColor;
  final Color inactiveDotColor;
  final Function(int)? onPageChanged;
  final bool autoPlay;

  const ImageCarousel({
    super.key,
    required this.images,
    this.height = 300,
    this.currentIndex,
    this.activeDotColor = Colors.blue,
    this.inactiveDotColor = Colors.white,
    this.onPageChanged,
    this.autoPlay = true,
  });

  @override
  Widget build(BuildContext context) {
    // Local reactive index if external one isn't provided
    final RxInt localIndex = (currentIndex ?? RxInt(0));

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: height,
            viewportFraction: 1.0,
            autoPlay: autoPlay,
            onPageChanged: (index, reason) {
              localIndex.value = index;
              onPageChanged?.call(index);
            },
          ),
          items:
              images.map((image) {
                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: image, fit: BoxFit.cover),
                  ),
                );
              }).toList(),
        ),
        Positioned(
          bottom: 16,
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                images.length,
                (index) => Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        localIndex.value == index
                            ? activeDotColor
                            : inactiveDotColor,
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
