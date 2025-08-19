import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/features/contract_details/contract_details_controller.dart';

class DownloadDialog {
  final controller = Get.find<ContractDetailsController>();

  void show() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Obx(() {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(
                  value: controller.progress.value,
                  backgroundColor: ColorManager.grey2,
                ),
                const SizedBox(height: 12),
                Text(
                  '${(controller.progress.value * 100).toStringAsFixed(1)}%',
                  style: Get.textTheme.bodyLarge,
                ),
              ],
            );
          }),
        ),
      ),
      barrierDismissible: false,
    );
  }
}
