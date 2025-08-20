import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/custom_cached_network_image_widget.dart';
import 'package:property_ms/features/widgets/panorama_viewer/panorama_fullscreen_page.dart';

class ImageCarousel extends StatelessWidget {
  final List<String> images;
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
                final isPanorama = image.toLowerCase().contains('_360_');
                if (isPanorama) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => PanoramaFullscreenPage(imageUrl: image));
                    },
                    child: Stack(
                      children: [
                        CustomCachedNetworkImage(
                          imageUrl: image,
                          width: AppSize.sWidth,
                          height: height,
                          fit: BoxFit.cover,
                        ),
                        const Positioned(
                          right: 16,
                          bottom: 16,
                          child: Icon(
                            Icons.threesixty,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  // Normal image
                  return CustomCachedNetworkImage(
                    imageUrl: image,
                    width: AppSize.sWidth,
                    fit: BoxFit.cover,
                  );
                }
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
