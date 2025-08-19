import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/custom_cached_network_image_widget.dart';
import 'package:property_ms/features/widgets/favorite_icon_button.dart';

class TourisemCardSmallModel {
  final String title;
  final String location;
  final double area;
  final double price;
  final AssetGenImage image;
  TourisemCardSmallModel({
    required this.title,
    required this.location,
    required this.area,
    required this.price,
    required this.image,
  });
}

class TourisemCardSmall extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final model;
  final bool isLoading;

  const TourisemCardSmall({
    super.key,
    required this.model,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        width: AppSize.sWidth * 0.99,
        height: AppSize.sHeight * 0.15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isLoading ? Colors.transparent : Colors.white,
          border: isLoading ? Border.all() : null,
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
                    child: CustomCachedNetworkImage(
                      imageUrl: model.postImage,
                      height: AppSize.sHeight * 0.12,
                      width: AppSize.sWidth * 0.33,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 16,
                  ),
                  child: FavoriteIconButton(
                    propertyId: model.propertyId,
                    initialIsFavorite: model.isFavorite,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppSize.s4),
                  Text(
                    '${model.postTitle} ',
                    style: Get.textTheme.bodyLarge!.copyWith(
                      fontSize: FontSize.s14,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: ColorManager.orangeColor,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      SizedBox(
                        width: AppSize.sWidth * .30,
                        child: Text(
                          model.location,
                          style: Get.textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: FontSize.s10,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(' \$${model.price}', style: Get.textTheme.bodyLarge),
                      const SizedBox(width: 8),
                      const Text('يومي'),
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
