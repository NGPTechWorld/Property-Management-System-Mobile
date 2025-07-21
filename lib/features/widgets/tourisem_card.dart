import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';

class TourisemCardModel {
  final String title;
  final String location;
  final String priceUnit;
  final double rate;
  final double price;
  final AssetGenImage image;
  TourisemCardModel({
    required this.title,
    required this.location,
    required this.priceUnit,
    required this.rate,
    required this.price,
    required this.image,
  });
}

class TourisemCard extends StatelessWidget {
  final TourisemCardModel model;
  const TourisemCard({super.key, required this.model});

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
                      icon: Assets.icons.favoriteFillIcon.svg(
                        colorFilter: const ColorFilter.mode(
                          ColorManager.grey3,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // const SizedBox(width: 12),
            Expanded(
              child: Padding(
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
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          ' \$${model.price.toString()}',
                          style: Get.textTheme.bodyLarge,
                        ),
                        Text(
                          ' ${model.priceUnit}',
                          style: Get.textTheme.bodyLarge!.copyWith(
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
