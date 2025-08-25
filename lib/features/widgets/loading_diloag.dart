import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';

class LoadingDiloag {
  static void show() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(color: ColorManager.cardHead),
              const SizedBox(height: 12),
              Text('جاري التحميل ...', style: Get.textTheme.bodyLarge),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}
