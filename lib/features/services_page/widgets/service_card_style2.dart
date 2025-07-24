import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/custom_cached_network_image_widget.dart';
import 'package:property_ms/data/dto/service_dto.dart';

class ServiceCardStyle2 extends StatelessWidget {
  final ServiceDto model;
  const ServiceCardStyle2({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.sWidth,
      height: AppSize.sHeight * 0.13,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: ClipOval(
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
                        Icons.home_repair_service,
                        color: ColorManager.primary5Color,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        model.career,
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

                  // const SizedBox(height: 8),
                ],
              ),
            ),
          ),
          Row(
            children: [
              const Icon(Icons.star, color: ColorManager.yello, size: 18),
              const SizedBox(width: 4),
              Text(model.rate.toString(), style: Get.textTheme.bodyLarge),
            ],
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
