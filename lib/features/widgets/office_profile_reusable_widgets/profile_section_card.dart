import 'package:flutter/material.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';

class ProfileSectionCard extends StatelessWidget {
  final Widget child;
  final Color? color;
  final Border? border;

  const ProfileSectionCard({
    super.key,
    required this.child,
    this.color,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: AppSize.s8, vertical: 6),
      decoration: BoxDecoration(
        color: color ?? ColorManager.cardBack3,
        borderRadius: BorderRadius.circular(20),
        border: border,
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: child,
    );
  }
}
