import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';

class CardAnswerMulti extends StatelessWidget {
  final int index;
  final bool isSelected;
  final VoidCallback onTap;
  final String text;

  const CardAnswerMulti({
    super.key,
    required this.index,
    required this.isSelected,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppPadding.p14,
        vertical: AppPadding.p4,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: ColorManager.whiteColor,
            borderRadius: BorderRadius.circular(AppSize.s10),
            border: Border.all(
              color:
                  isSelected
                      ? ColorManager.primaryDark.withAlpha(200)
                      : ColorManager.whiteColor,
              width: 2,
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p12,
            vertical: AppPadding.p4,
          ),
          child: Row(
            children: [
              Checkbox(
                value: isSelected,
                onChanged: (_) => onTap(),
                activeColor: ColorManager.primaryDark,
              ),
              SizedBox(width: AppSize.s14),
              Expanded(child: Text(text, style: Get.textTheme.bodyMedium)),
            ],
          ),
        ),
      ),
    );
  }
}
