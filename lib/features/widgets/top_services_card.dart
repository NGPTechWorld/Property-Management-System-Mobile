import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/custom_cached_network_image_widget.dart';
import 'package:property_ms/data/dto/service_dto.dart';

class TopServicesCard extends StatelessWidget {
  final ServiceDto model;
  final bool isLoaging;
  const TopServicesCard({
    super.key,
    required this.model,
    this.isLoaging = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.sWidth * 0.75,
      height: AppSize.sHeight * 0.16,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: isLoaging ? Colors.transparent : ColorManager.white,
        border: isLoaging ? Border.all() : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child:
                  model.logo == ""
                      ? ClipOval(
                        child: Assets.images.officeServicesCard.image(
                          fit: BoxFit.cover,
                        ),
                      )
                      : ClipOval(
                        child: CustomCachedNetworkImage(
                          imageUrl: model.logo,

                          fit: BoxFit.cover,
                        ),
                      ),
            ),
          ),

          // const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    style: Get.textTheme.bodyLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Center(
                    child: Text(
                      model.career,
                      style: Get.textTheme.bodyLarge!.copyWith(
                        fontSize: FontSize.s12,
                      ),
                      overflow: TextOverflow.ellipsis,
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
                  // const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
