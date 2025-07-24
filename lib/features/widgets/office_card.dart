import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/custom_cached_network_image_widget.dart';
import 'package:property_ms/data/dto/office_dto.dart';

class OfficeCard extends StatelessWidget {
  final OfficeDto model;
  final bool isLoaging;
  const OfficeCard({super.key, required this.model, this.isLoaging = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.sWidth * 0.32,
      height: AppSize.sHeight * 0.22,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: isLoaging ? Colors.transparent : ColorManager.white,
        border: isLoaging ? Border.all() : null,
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
                model.logo == ""
                    ? ClipOval(
                      child: Assets.images.officePropertyCard.image(
                        height: AppSize.sHeight * 0.1,
                        width: AppSize.sHeight * 0.1,
                        fit: BoxFit.cover,
                      ),
                    )
                    : ClipOval(
                      child: CustomCachedNetworkImage(
                        imageUrl: model.logo,
                        height: AppSize.sHeight * 0.1,
                        width: AppSize.sHeight * 0.1,
                        fit: BoxFit.cover,
                      ),
                    ),
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
                        model.type,
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      model.name,
                      style: Get.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: FontSize.s12,
                      ),
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
                      Expanded(
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          model.location,
                          style: Get.textTheme.bodySmall!.copyWith(
                            fontSize: FontSize.s10,

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
