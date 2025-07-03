import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';

class PropertySaleCardModel {
  final String title;
  final String location;
  final double area;
  final double price;
  final AssetGenImage image;
  PropertySaleCardModel({
    required this.title,
    required this.location,
    required this.area,
    required this.price,
    required this.image,
  });
}

class PropertySaleCard extends StatelessWidget {
  final PropertySaleCardModel model;
  const PropertySaleCard({super.key, required this.model});

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
                    child: model.image.image(
                      height: AppSize.sHeight * 0.18,
                      width: AppSize.sWidth * 0.425,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 14,
                  ),
                  child: CircleAvatar(
                    backgroundColor: ColorManager.cardBackground,
                    child: IconButton(
                      onPressed: () {},
                      icon: Assets.icons.favorite.svg(
                        colorFilter: const ColorFilter.mode(
                          ColorManager.redColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
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
                        'للبيع',
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

            // const SizedBox(width: 12),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.title,
                    style: Get.textTheme.bodyLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.area_chart,
                        color: ColorManager.primary5Color,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        model.area.toString(),
                        style: Get.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: ColorManager.redColor,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        model.location,
                        style: Get.textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: FontSize.s10,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        ' \$${model.price.toString()}',
                        style: Get.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
