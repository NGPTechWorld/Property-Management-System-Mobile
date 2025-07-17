import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';

class ScreenBottomEffect extends StatelessWidget {
  const ScreenBottomEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: IgnorePointer(
        child: Container(
          height: Get.context!.height * 0.15,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                ColorManager.primaryColor.withAlpha((0.3 * 255).round()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
