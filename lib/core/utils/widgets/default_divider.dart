import 'package:flutter/material.dart';
import 'package:property_ms/core/utils/color_manager.dart';

class DefaultDivider extends StatelessWidget {
  const DefaultDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      indent: 50,
      endIndent: 50,
      color: ColorManager.primary3Color,
      height: 12,
    );
  }
}
