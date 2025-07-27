import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/normal_app_bar.dart';
import 'package:property_ms/features/compare_pages/compare_properties/widgets/property_comparison_widget.dart';

import 'compare_properties_controller.dart';

class ComparePropertiesPage extends GetView<ComparePropertiesController> {
  const ComparePropertiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NormalAppBar(title: 'مقارنة عقارين', backIcon: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),

          child: Column(
            children: [
              // PropertyComparisonWidget(
              //   property1: controller.propertyDetails,
              //   property2: controller.propertyDetails2,
              // ),
              const SizedBox(height: AppSize.s100),
            ],
          ),
        ),
      ),
    );
  }
}
