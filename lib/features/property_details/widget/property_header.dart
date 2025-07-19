import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/app_button.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/reusable/lacation_card.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/reusable/map_button.dart';

class PropertyHeader extends StatelessWidget {
  const PropertyHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                Icon(Icons.access_time),
                SizedBox(width: AppSize.s18),
                Text('تاريخ النشر :  2015/4/23'),
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
                  'للبيع',
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
              "العنوان:  بيت أبو العود",
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
            ),
          ],
        ),
        const SizedBox(height: AppSize.s16),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [LocationCard(location: 'ريف,دمشق قدسيا'), MapButton()],
        ),
      ],
    );
  }
}
