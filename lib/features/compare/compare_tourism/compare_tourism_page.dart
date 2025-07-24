import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/normal_app_bar.dart';
import 'package:property_ms/features/compare/compare_tourism/widgets/tourism_comparison_widget.dart';

import 'compare_tourism_controller.dart';

class CompareTourismPage extends GetView<CompareTourismController> {
  const CompareTourismPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NormalAppBar(title: 'مقارنة سياحية', backIcon: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
          child: Column(
            children: [
              TourismComparisonWidget(
                tourism1: controller.tourism1,
                tourism2: controller.tourism2,
              ),
              const SizedBox(height: AppSize.s100),
            ],
          ),
        ),
      ),
    );
  }
}
