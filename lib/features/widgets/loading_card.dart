import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';

class LoadingCard extends StatelessWidget {
  final bool isSmall;
  const LoadingCard({super.key, this.isSmall = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p24),
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.lightPrimaryColor.withAlpha(50),
          borderRadius: BorderRadius.circular(AppSize.s24),
        ),
        child: DottedBorder(
          options: const RoundedRectDottedBorderOptions(
            radius: Radius.circular(AppSize.s24),
            color: ColorManager.primaryColor,
            strokeWidth: 2,
            dashPattern: [10, 4],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: AppPadding.p18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    width:
                        isSmall ? AppSize.sWidth * 0.2 : AppSize.sWidth * 0.5,
                    height:
                        isSmall ? AppSize.sWidth * 0.2 : AppSize.sWidth * 0.5,
                    child: const CircularProgressIndicator(
                      color: ColorManager.primaryColor,
                      strokeWidth: 3,
                    ),
                  ),
                ),
                const SizedBox(height: AppPadding.p16),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p14,
                  ),
                  child: Text(
                    "جاري التحميل...",
                    style: Get.textTheme.bodyLarge!.copyWith(
                      color: ColorManager.primary5Color,
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
