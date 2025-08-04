import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:property_ms/data/dto/user_reservation_dto.dart';

class ReservationCard extends StatelessWidget {
  final UserReservationDto model;
  final bool isLoaging;
  const ReservationCard({
    super.key,
    required this.model,
    this.isLoaging = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Container(
        width: AppSize.sWidth * 0.99,
        height: AppSize.sHeight * 0.18,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isLoaging ? Colors.transparent : ColorManager.white,
          border: isLoaging ? Border.all() : null,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 8),

            Stack(
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Assets.images.property.image(
                      height: AppSize.sHeight * 0.12,
                      width: AppSize.sWidth * 0.33,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                model.type == "عقاري"
                    ? Padding(
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
                            color: ColorManager.primaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'للإيجار',
                            style: Get.textTheme.bodySmall!.copyWith(
                              color: ColorManager.whiteColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                    : Container(),
              ],
            ),

            // Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 1,
                children: [
                  SizedBox(
                    width: AppSize.sWidth * .30,
                    child: Text(
                      model.title,
                      style: Get.textTheme.bodyLarge!.copyWith(
                        fontSize: FontSize.s14,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
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
                        model.location,
                        overflow: TextOverflow.ellipsis,
                        style: Get.textTheme.bodyLarge!.copyWith(
                          fontSize: FontSize.s12,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Assets.icons.target.svg(
                        // ignore: deprecated_member_use_from_same_package
                        color: ColorManager.primary5Color,
                        width: 18,
                      ),

                      const SizedBox(width: 4),
                      Text(
                        "الحالة : ",
                        overflow: TextOverflow.ellipsis,
                        style: Get.textTheme.bodyLarge!.copyWith(
                          fontSize: FontSize.s12,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        model.state,
                        overflow: TextOverflow.ellipsis,
                        style: Get.textTheme.bodyLarge!.copyWith(
                          fontSize: FontSize.s12,
                          color:
                              model.state == "مؤجر"
                                  ? ColorManager.greenColor
                                  : model.state == "محجوز"
                                  ? ColorManager.yello
                                  : ColorManager.redColor,
                        ),
                      ),
                    ],
                  ),
                  // const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        "تاريخ البداية:  ",
                        style: Get.textTheme.bodyLarge!.copyWith(
                          fontSize: FontSize.s12,
                        ),
                      ),
                      Text(
                        model.startDate,
                        style: Get.textTheme.bodyMedium!.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "تاريخ النهاية:  ",
                        style: Get.textTheme.bodyLarge!.copyWith(
                          fontSize: FontSize.s12,
                        ),
                      ),
                      Text(
                        model.endDate,
                        style: Get.textTheme.bodyMedium!.copyWith(fontSize: 12),
                      ),
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
