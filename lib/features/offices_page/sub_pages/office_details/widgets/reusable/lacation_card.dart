import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/reusable/profile_section_card.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({super.key, required this.loctation});
  final String loctation;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.s160,
      child: ProfileSectionCard(
        child: Column(
          children: [
            Assets.icons.locationIcon.svg(
              width: 28,
              height: 28,
              colorFilter: const ColorFilter.mode(
                Colors.blueGrey,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              loctation.replaceFirst(' ', '\n'),
              textAlign: TextAlign.center,
              style: Get.textTheme.bodyMedium?.copyWith(
                color: const Color(0xFF3F3D56),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
