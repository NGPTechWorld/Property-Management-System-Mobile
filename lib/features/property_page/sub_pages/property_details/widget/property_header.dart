import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/app_button.dart';
import 'package:property_ms/data/models/property_model.dart';
import 'package:property_ms/features/property_page/sub_pages/property_details/property_details_controller.dart';
import 'package:property_ms/features/property_page/sub_pages/property_details/widget/property_details_widget.dart';
import 'package:property_ms/features/widgets/office_profile_reusable_widgets/lacation_card.dart';
import 'package:property_ms/features/widgets/office_profile_reusable_widgets/map_button.dart';

class PropertyHeader extends GetView<PropertyDetailsController> {
  final PropertyModel model;

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
                Text('تاريخ النشر :  ${model.postDate}'),
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
                  model.listingType,
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
          children: [
            Text(
              "العنوان:",
              style: Get.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Text(
                " ${model.postTitle}",
                style: Get.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: ColorManager.primaryDark,
                ),
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
              onPressed: () => controller.openSelectPropertyBottomSheet(),
            ),
          ],
        ),

        model.listingType == "أجار"
            ? const Column(
              children: [
                SizedBox(height: AppSize.s16),
                Row(children: [Expanded(child: RatingSection())]),
              ],
            )
            : Container(),

        const SizedBox(height: AppSize.s16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [LocationCard(location: model.location), const MapButton()],
        ),
      ],
    );
  }
}
