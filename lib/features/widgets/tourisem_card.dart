import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/custom_cached_network_image_widget.dart';
import 'package:property_ms/data/dto/tourism_dto.dart';

class TourisemCard extends StatelessWidget {
  final TourismDto model;
  final bool isLoading;

  const TourisemCard({super.key, required this.model, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Container(
        width: AppSize.sWidth * 0.85,
        height: AppSize.sHeight * 0.2,
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
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorManager.cardBackground,
                      ),
                      child: Center(
                        child: Assets.icons.favoriteFillIcon.svg(
                          width: 16,
                          colorFilter: ColorFilter.mode(
                            model.isFavorite ? Colors.red : ColorManager.grey3,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.postTitle,
                      style: Get.textTheme.bodyLarge!.copyWith(
                        fontSize: FontSize.s12,
                      ),
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
                          model.avgRate.toString(),
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
                        Expanded(
                          child: Text(
                            model.location,
                            overflow: TextOverflow.ellipsis,
                            style: Get.textTheme.bodySmall!.copyWith(
                              fontSize: FontSize.s10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          ' \$${model.price}',
                          style: Get.textTheme.bodyLarge,
                        ),
                        const SizedBox(width: 8),
                        const Text('يومي'),
                        // if (model.priceUnit != null &&
                        //     model.priceUnit!.isNotEmpty)
                        //   Text(
                        //     ' ${model.priceUnit}',
                        //     style: Get.textTheme.bodyLarge!.copyWith(
                        //       fontSize: 12,
                        //     ),
                        //   ),
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
