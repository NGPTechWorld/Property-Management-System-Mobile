import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/custom_cached_network_image_widget.dart';
import 'package:property_ms/data/dto/office_dto.dart';

class OfficeCardStyle2 extends StatelessWidget {
  final OfficeDto model;
  final bool isLoaging;
  const OfficeCardStyle2({
    super.key,
    required this.model,
    this.isLoaging = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.sWidth,
      height: AppSize.sHeight * 0.13,
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child:
                      model.logo == ""
                          ? ClipOval(
                            child: Assets.images.officePropertyCard.image(
                              fit: BoxFit.cover,
                            ),
                          )
                          : ClipOval(
                            child: CustomCachedNetworkImage(
                              imageUrl: model.logo,
                              width: AppSize.sWidth * 0.23,
                              height: AppSize.sWidth * 0.23,
                              fit: BoxFit.cover,
                            ),
                          ),
                  //  ClipOval(
                  //   child: model.image.image(
                  //     // height: AppSize.sHeight * 0.15,
                  //     // width: AppSize.sWidth * 0.425,
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: AppPadding.p12,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    style: Get.textTheme.bodyLarge!.copyWith(
                      fontSize: FontSize.s14,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
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
          Assets.icons.arrowPrevSmall.svg(
            colorFilter: const ColorFilter.mode(
              ColorManager.primary5Color,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: AppSize.s10),
        ],
      ),
    );
  }
}
