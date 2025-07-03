import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';

class ServicesCardModel {
  final String title;
  final String location;
  final String tupe;
  final double rate;
  final AssetGenImage image;
  ServicesCardModel({
    required this.title,
    required this.location,
    required this.tupe,
    required this.rate,
    required this.image,
  });
}

class ServicesCard extends StatelessWidget {
  final ServicesCardModel model;
  const ServicesCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.sWidth * 0.75,
      height: AppSize.sHeight * 0.16,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: ClipOval(
                child: model.image.image(
                  // height: AppSize.sHeight * 0.15,
                  // width: AppSize.sWidth * 0.425,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.title,
                    style: Get.textTheme.bodyLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Center(
                    child: Text(
                      model.tupe,
                      style: Get.textTheme.bodyLarge!.copyWith(
                        fontSize: FontSize.s12,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
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
                      Text(
                        overflow: TextOverflow.ellipsis,
                        model.location,
                        style: Get.textTheme.bodySmall!.copyWith(
                          fontSize: FontSize.s10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
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
                  // const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
