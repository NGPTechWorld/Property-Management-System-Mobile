import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/features/property_details/widget/details_container.dart';
import 'package:property_ms/features/property_details/widget/model/detail_item.dart';

class PropertyDetailsWidget extends StatelessWidget {
  const PropertyDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppSize.s24),
        Text(
          'تفاصيل العقار',
          style: Get.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        DetailsContainer(
          details: [
            DetailItem(
              label: "المساحة",
              value: "120 م²",
              icon: Icons.square_foot,
            ),
            DetailItem(
              label: "نوع الملكية",
              value: "سكني",
              icon: Icons.home_work_outlined,
            ),
            DetailItem(label: "الجهة", value: "جنوبية", icon: Icons.explore),
            DetailItem(label: "الفرش", value: "مفروش", icon: Icons.weekend),
            DetailItem(
              label: "عدد الغرف",
              value: "3",
              icon: Icons.meeting_room_outlined,
            ),
            DetailItem(label: "التقسيط", value: "متاح", icon: Icons.payments),
            DetailItem(label: "الطابق", value: "الثالث", icon: Icons.stairs),
          ],
        ),
      ],
    );
  }
}
