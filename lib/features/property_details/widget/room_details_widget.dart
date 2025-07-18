import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/features/property_details/widget/details_container.dart';
import 'package:property_ms/features/property_details/widget/model/detail_item.dart';

class RoomDetailsWidget extends StatelessWidget {
  const RoomDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
            DetailItem(label: "غرفة نوم", value: '2', icon: Icons.bed_outlined),
            DetailItem(
              label: "غرفة معيشة",
              value: '1',
              icon: Icons.weekend_outlined,
            ),
            DetailItem(label: "حمام", value: '2', icon: Icons.bathtub_outlined),
            DetailItem(label: "مطبخ", value: '1', icon: Icons.kitchen_outlined),
          ],
        ),
      ],
    );
  }
}
