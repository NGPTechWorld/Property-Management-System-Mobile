import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';

class ErrorNetworkCard extends StatelessWidget {
  final bool isSmall;
  const ErrorNetworkCard({super.key, this.isSmall = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p24),
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.redColor.withAlpha(20),
          borderRadius: BorderRadius.circular(AppSize.s24),
        ),
        child: DottedBorder(
          options: const RoundedRectDottedBorderOptions(
            radius: Radius.circular(AppSize.s24),
            color: ColorManager.redColor,
            strokeWidth: 2,
            dashPattern: [10, 4],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: AppPadding.p18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Assets.images.boxError.image(
                    width:
                        isSmall ? AppSize.sWidth * 0.25 : AppSize.sWidth * 0.5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p14,
                  ),
                  child: Text(
                    "لا يوجد إتصال !",
                    style: Get.textTheme.bodyLarge!.copyWith(
                      color: ColorManager.redColor,
                      fontSize: isSmall ? FontSize.s14 : FontSize.s18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
