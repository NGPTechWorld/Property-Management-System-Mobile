
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/reusable/time_card.dart';

class WorkingHoursRow extends StatelessWidget {
  const WorkingHoursRow({
    super.key,
    required this.startTime,
    required this.endTime,
  });

  final String startTime;
  final String endTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TimeCard(time: startTime, period: 'صباحاً'),
        Text(
          'إلى',
          style: Get.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        TimeCard(time: endTime, period: 'مساءً'),
      ],
    );
  }
}