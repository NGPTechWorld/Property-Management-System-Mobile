import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/features/property_page/sub_pages/property_details/model/property_details_model.dart';
import 'package:property_ms/features/widgets/property_reusable_widget/details_container.dart';

class PropertyDetailsWidget extends StatelessWidget {
  final PropertyDetailsModel model;

  const PropertyDetailsWidget({super.key, required this.model});

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
              value: model.area,
              icon: Icons.square_foot_outlined,
            ),
            DetailItem(
              label: "نوع الملكية",
              value: model.ownershipType,
              icon: Icons.home_work_outlined,
            ),
            DetailItem(
              label: "الجهة",
              value: model.orientation,
              icon: Icons.explore_outlined,
            ),
            DetailItem(
              label: "الفرش",
              value: model.furnishing,
              icon: Icons.weekend_outlined,
            ),
            DetailItem(
              label: "عدد الغرف",
              value: model.roomCount.toString(),
              icon: Icons.meeting_room_outlined,
            ),
            DetailItem(
              label: "التقسيط",
              value: model.installmentAvailable,
              icon: Icons.payments_outlined,
            ),
            DetailItem(
              label: "الطابق",
              value: model.floor,
              icon: Icons.stairs_outlined,
            ),
          ],
        ),
      ],
    );
  }
}
