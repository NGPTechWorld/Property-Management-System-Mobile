import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';

class PropertyRentCardModel {
  final String title;
  final String location;
  final String priceUnit;
  final double rate;
  final double price;
  final AssetGenImage image;
  PropertyRentCardModel({
    required this.title,
    required this.location,
    required this.priceUnit,
    required this.rate,
    required this.price,
    required this.image,
  });
}

class PropertyRentCard extends StatelessWidget {
  final PropertyRentCardModel model;
  const PropertyRentCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Container(
        width: AppSize.sWidth * 0.85,
        height: AppSize.sHeight * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 8),
            Stack(
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: model.image.image(height: AppSize.sHeight * 0.18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
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
                        color: ColorManager.primaryDark,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'للإيجار',
                        style: Get.textTheme.bodyMedium!.copyWith(
                          color: ColorManager.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // const SizedBox(width: 12),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.title,
                      style: Get.textTheme.bodyLarge!.copyWith(
                        color: ColorManager.secColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 18),
                        const SizedBox(width: 4),
                        Text(
                          model.rate.toString(),
                          style: Get.textTheme.bodyLarge!.copyWith(
                            color: ColorManager.secColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 18,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          model.location,
                          style: Get.textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: ColorManager.secColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          ' \$${model.price.toString()}',
                          style: Get.textTheme.bodyLarge!.copyWith(
                            color: ColorManager.secColor,
                          ),
                        ),
                        Text(
                          ' ${model.priceUnit}',
                          style: Get.textTheme.bodyLarge!.copyWith(
                            color: ColorManager.secColor,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
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
