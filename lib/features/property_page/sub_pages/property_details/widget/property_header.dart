import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/routes/app_routes.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/app_button.dart';
import 'package:property_ms/features/property_page/sub_pages/property_details/model/property_details_model.dart';
import 'package:property_ms/features/widgets/office_profile_reusable_widgets/lacation_card.dart';
import 'package:property_ms/features/widgets/office_profile_reusable_widgets/map_button.dart';

class PropertyHeader extends StatelessWidget {
  final PropertyDetailsModel model;

  const PropertyHeader({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.access_time),
                const SizedBox(width: AppSize.s18),
                Text('تاريخ النشر :  ${model.publishDate}'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: ColorManager.primaryDark,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  model.status,
                  style: Get.textTheme.bodySmall!.copyWith(
                    color: ColorManager.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "العنوان: ${model.title}",
              style: Get.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: ColorManager.primaryDark,
              ),
            ),
            AppButton(
              text: 'قارن',
              radius: AppSize.s16,
              icon: Assets.icons.property.svg(
                colorFilter: const ColorFilter.mode(
                  ColorManager.white,
                  BlendMode.srcIn,
                ),
              ),
              backgroundColor: ColorManager.yello,
              iconOnLeft: true,
              onPressed: () => Get.toNamed(AppRoutes.comparePropertiesPage),
            ),
          ],
        ),
        Text(
          'تفاصيل العقار',
          style: Get.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p16,
            vertical: AppPadding.p8,
          ),
          child: Text(
            model.description,
            style: Get.textTheme.bodyMedium?.copyWith(
              color: ColorManager.textColor1,
              height: 1.7,
            ),
          ),
        ),
        const SizedBox(height: AppSize.s16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [LocationCard(location: model.location), const MapButton()],
        ),
      ],
    );
  }
}
