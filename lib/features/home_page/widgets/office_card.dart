import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:auto_size_text/auto_size_text.dart';

class OfficeCardModel {
  final String title;
  final String type;
  final String location;
  final double rate;
  final AssetGenImage image;
  OfficeCardModel({
    required this.title,
    required this.type,
    required this.location,
    required this.rate,
    required this.image,
  });
}

class OfficeCard extends StatelessWidget {
  final OfficeCardModel model;
  const OfficeCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.sWidth * 0.32,
      height: AppSize.sHeight * 0.22,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipOval(
                  child: model.image.image(
                    height: AppSize.sHeight * 0.1,
                    width: AppSize.sHeight * 0.1,
                    fit: BoxFit.cover,
                  ),
                ),

                // SizedBox(height: AppSize.sHeight * 0.101),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: ColorManager.primaryDark,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'سياحي',
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
          ),

          // const SizedBox(width: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(model.title, style: Get.textTheme.bodyLarge),
                  ),
                  const SizedBox(height: 4),

                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: ColorManager.primary5Color,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: AutoSizeText(
                          model.location,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Get.textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.star,
                        color: ColorManager.yello,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        model.rate.toString(),
                        style: Get.textTheme.bodyLarge,
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
