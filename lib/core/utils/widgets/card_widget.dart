import 'package:flutter/material.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.child,
    this.color = ColorManager.whiteColor,
  });

  final Color? color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.sWidth,
      padding: EdgeInsets.all(AppSize.sWidth * 0.035),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(AppSize.s8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: child,
    );
  }
}
