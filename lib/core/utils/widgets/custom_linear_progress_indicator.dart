import 'package:flutter/material.dart';
import '../color_manager.dart';
import '../values_manager.dart';

class CustomLinearProgressIndicator extends StatelessWidget {
  const CustomLinearProgressIndicator({
    super.key,
    this.valueColor,
    this.minHeight = 10,
    required this.maxValue,
    required this.currentValue,
  });

  final Color? valueColor;
  final double minHeight;
  final double maxValue;
  final double currentValue;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: LinearProgressIndicator(
        // current / max
        value: currentValue / maxValue,
        minHeight: minHeight,
        backgroundColor: ColorManager.colorDoveGray100,
        valueColor: AlwaysStoppedAnimation<Color>(
          valueColor ?? ColorManager.colorPrimary,
        ),
        borderRadius: BorderRadius.circular(AppSize.s10),
      ),
    );
  }
}
