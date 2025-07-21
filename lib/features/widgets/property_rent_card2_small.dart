import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';

class PropertyRentCard2SmallModel {
  final String title;
  final String location;
  final String priceUnit;
  final double rate;
  final double price;
  final AssetGenImage image;

  PropertyRentCard2SmallModel({
    required this.title,
    required this.location,
    required this.priceUnit,
    required this.rate,
    required this.price,
    required this.image,
  });
}

class PropertyRentCard2Small extends StatelessWidget {
  final PropertyRentCard2SmallModel model;

  const PropertyRentCard2Small({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        width: AppSize.sWidth * 0.99,
        height: AppSize.sHeight * 0.15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 8),

            // Image + tag + favIcon
            Stack(
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: model.image.image(
                      height: AppSize.sHeight * 0.12,
                      width: AppSize.sWidth * 0.33,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 18,
                  ),
                  child: GestureDetector(
                    onTap: () {}, // Add controller logic if needed
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorManager.cardBackground,
                      ),
                      child: Center(
                        child: Assets.icons.favoriteFillIcon.svg(
                          width: 16, // 👈 حجم الأيقونة

                          colorFilter: const ColorFilter.mode(
                            ColorManager.grey3,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
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
                        color: ColorManager.primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'للإيجار',
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

            // Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppSize.s4),
                  SizedBox(
                    width: AppSize.sWidth * .30,
                    child: Text(
                      model.title,
                      style: Get.textTheme.bodyLarge,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  // const SizedBox(height: 4),
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
                  // const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: ColorManager.primary5Color,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        model.location,
                        overflow: TextOverflow.ellipsis,
                        style: Get.textTheme.bodySmall!.copyWith(
                          fontSize: FontSize.s10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  // const SizedBox(height: 8),
                  Row(
                    children: [
                      Text('\$${model.price}', style: Get.textTheme.bodyLarge),
                      Text(
                        ' ${model.priceUnit}',
                        style: Get.textTheme.bodyLarge!.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Spacer(),

            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorManager.primaryDark.withAlpha(20),
              ),
              child: Assets.icons.arrowPrevSmall.svg(
                colorFilter: const ColorFilter.mode(
                  ColorManager.primaryDark,
                  BlendMode.srcIn,
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}
