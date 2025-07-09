import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/features/widgets/office_card.dart';

class TopOffice extends StatelessWidget {
  const TopOffice({super.key, required this.controller});

  final controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
          child: Text(
            "أفضل المكاتب",
            style: Get.textTheme.headlineMedium!.copyWith(
              color: ColorManager.secColor,
            ),
          ),
        ),
        const SizedBox(height: AppSize.s18),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(controller.topOffices.length, (index) {
              final item = controller.topOffices[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p6),
                child: OfficeCard(model: item),
              );
            }),
          ),
        ),
        const SizedBox(height: AppSize.s16),
      ],
    );
  }
}
