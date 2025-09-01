import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/normal_app_bar.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/features/property_page/sub_pages/compare_properties/widgets/property_comparison_widget.dart';

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
              Obx(
                () =>
                    controller.loadingState.value == LoadingState.loading
                        ? const Center(
                          child: SpinKitThreeBounce(
                            color: ColorManager.cardHead,
                            size: 18,
                          ),
                        )
                        : PropertyComparisonWidget(
                          property1: controller.property1!,
                          property2: controller.property2!,
                        ),
              ),
              const SizedBox(height: AppSize.s100),
            ],
          ),
        ),
      ),
    );
  }
}
