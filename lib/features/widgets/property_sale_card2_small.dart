import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';

class PropertySaleCard2SmallModel {
  final String title;
  final String location;
  final double area;
  final double price;
  final AssetGenImage image;
  PropertySaleCard2SmallModel({
    required this.title,
    required this.location,
    required this.area,
    required this.price,
    required this.image,
  });
}

class PropertySaleCard2Small extends StatelessWidget {
  final PropertySaleCard2SmallModel model;
  const PropertySaleCard2Small({super.key, required this.model});

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
          children: [
            const SizedBox(width: 8),
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

                // Padding(
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: 8,
                //     vertical: 18,
                //   ),
                //   child: CircleAvatar(
                //     backgroundColor: ColorManager.cardBackground,
                //     maxRadius: 16,
                //     child: IconButton(
                //       onPressed: () {},
                //       icon: Assets.icons.favorite.svg(
                //         colorFilter: const ColorFilter.mode(
                //           ColorManager.redColor,
                //           BlendMode.srcIn,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 18,
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 32, // 👈 حجم الدائرة
                      height: 32,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorManager.cardBackground,
                      ),
                      child: Center(
                        child: Assets.icons.favorite.svg(
                          width: 24, // 👈 حجم الأيقونة
                          height: 24,
                          colorFilter: const ColorFilter.mode(
                            ColorManager.redColor,
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisSize: Main,
                children: [
                  const SizedBox(height: AppSize.s4),
                  SizedBox(
                    width: AppSize.sWidth * .30,
                    child: Text(
                      '${model.title}  ${model.area} م²',
                      style: Get.textTheme.bodyLarge!.copyWith(
                        // fontWeight: FontWeight.w600,
                        // fontSize: FontSize.s15
                      ),

                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Row(
                  //   children: [
                  //     const Icon(
                  //       Icons.area_chart,
                  //       color: ColorManager.primary5Color,
                  //       size: 18,
                  //     ),
                  //     const SizedBox(width: 4),
                  //     Text(
                  //       model.area.toString(),
                  //       style: Get.textTheme.bodyLarge,
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(height: 4),
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
                      Text(
                        ' \$${model.price.toString()}',
                        style: Get.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Spacer(),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: ColorManager.primaryColor,
                shape: BoxShape.circle,
              ),
              child: Assets.icons.arrowPrevSmall.svg(
                colorFilter: const ColorFilter.mode(
                  ColorManager.white,
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
