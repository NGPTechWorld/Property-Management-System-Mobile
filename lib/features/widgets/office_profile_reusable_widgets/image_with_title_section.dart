import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/custom_cached_network_image_widget.dart';

class ImageWithTitleSection extends StatelessWidget {
  final String image;
  final String title;

  const ImageWithTitleSection({
    super.key,
    required this.image,
    required this.title,
     
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.lightPrimaryColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppPadding.p2),
            child: Center(
              child: ClipOval(
                child: CustomCachedNetworkImage(
                  imageUrl: image,
                  height: AppSize.sWidth * 0.3,
                  width: AppSize.sWidth * 0.3,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              title,
              style: Get.textTheme.bodyLarge!.copyWith(
                color: ColorManager.primaryDark,
              ),
            ),
          ),
          const SizedBox(height: AppSize.s12),
        ],
      ),
    );
  }
}
