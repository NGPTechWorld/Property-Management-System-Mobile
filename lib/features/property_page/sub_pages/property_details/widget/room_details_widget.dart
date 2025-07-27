import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/data/models/property_model.dart';
import 'package:property_ms/features/widgets/property_reusable_widget/details_container.dart';

class RoomDetailsWidget extends StatelessWidget {
  final RoomCounts roomDetails;

  const RoomDetailsWidget({super.key, required this.roomDetails});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppSize.s8),
        Text(
          'تفاصيل الغرف',
          style: Get.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        DetailsContainer(
          details: [
            DetailItem(
              label: "غرفة نوم",
              value: roomDetails.bedroom.toString(),
              icon: Icons.bed_outlined,
            ),
            DetailItem(
              label: "غرفة معيشة",
              value: roomDetails.livingRoom.toString(),
              icon: Icons.weekend_outlined,
            ),
            DetailItem(
              label: "حمام",
              value: roomDetails.bathroom.toString(),
              icon: Icons.bathtub_outlined,
            ),
            DetailItem(
              label: "مطبخ",
              value: roomDetails.kitchen.toString(),
              icon: Icons.kitchen_outlined,
            ),
          ],
        ),
      ],
    );
  }
}
