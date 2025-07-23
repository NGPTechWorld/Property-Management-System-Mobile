import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/data/dto/rent_dto.dart';

class PropertyRentCard extends StatelessWidget {
  final RentCardDto model;
  final bool isLoaging;
  const PropertyRentCard({
    super.key,
    required this.model,
    this.isLoaging = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Container(
        width: AppSize.sWidth * 0.85,
        height: AppSize.sHeight * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isLoaging ? Colors.transparent : ColorManager.white,
          border: isLoaging ? Border.all() : null,
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
                    child: Assets.images.property.image(
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
                        colorFilter:
                            model.isFavorite
                                ? const ColorFilter.mode(
                                  ColorManager.redColor,
                                  BlendMode.srcIn,
                                )
                                : const ColorFilter.mode(
                                  ColorManager.grey3,
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
                        color: ColorManager.primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        model.type == "عقار سكني" ? 'للإيجار' : "سياحي",
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.title,
                      style: Get.textTheme.bodyLarge!.copyWith(
                        fontSize: FontSize.s14,
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
                          model.avgRate.toStringAsFixed(1),
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
                          ' \$${model.price.toStringAsFixed(1)}',
                          style: Get.textTheme.bodyLarge,
                        ),
                        Text(
                          ' ${model.rentalPeriod}',
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
