import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/features/widgets/office_profile_reusable_widgets/profile_section_card.dart';

class MapButton extends StatelessWidget {
  const MapButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.s160,
      child: ProfileSectionCard(
        color: const Color(0xFFFFFAF0),
        border: Border.all(color: ColorManager.yello, width: 2),
        child: Column(
          children: [
            const Icon(Icons.map, color: ColorManager.yello, size: 28),
            const SizedBox(height: 6),
            Text(
              'عرض على\nالخريطة',
              textAlign: TextAlign.center,
              style: Get.textTheme.bodyMedium?.copyWith(
                color: ColorManager.yello,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
