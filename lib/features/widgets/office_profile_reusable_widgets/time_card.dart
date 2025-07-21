import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeCard extends StatelessWidget {
  final String time;
  final String period;

  const TimeCard({super.key, required this.time, required this.period});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F6FA),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF51708D), width: 1.5),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            time,
            style: Get.textTheme.titleMedium?.copyWith(
              color: const Color(0xFF3F3D56),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            period,
            style: Get.textTheme.bodySmall?.copyWith(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}