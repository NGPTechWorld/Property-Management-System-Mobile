// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';

class CardFilterModel {
  final String title;
  final SvgGenImage? icon;

  CardFilterModel({required this.title, this.icon});
}

final List<CardFilterModel> cardFilterDefault = [
  CardFilterModel(title: "الكل"),
  CardFilterModel(title: "سياحي", icon: Assets.icons.tourisem),
  CardFilterModel(title: "عقاري", icon: Assets.icons.property),
];

final List<CardFilterModel> cardFilterTypeProp = [
  CardFilterModel(title: "الكل"),
  CardFilterModel(title: "بيع", icon: Assets.icons.property),
  CardFilterModel(title: "إيجار", icon: Assets.icons.property),
];

final List<CardFilterModel> cardFilterDefaultPro = [
  CardFilterModel(title: "فلترة متقدمة"),
  CardFilterModel(title: "الكل"),
  CardFilterModel(title: "سياحي", icon: Assets.icons.tourisem),
  CardFilterModel(title: "عقاري", icon: Assets.icons.property),
];

class CardFilter extends StatelessWidget {
  final CardFilterModel model;
  final bool isSelect;
  const CardFilter({super.key, required this.model, required this.isSelect});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        height: 35,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          border:
              !isSelect ? Border.all(color: ColorManager.primaryDark) : null,
          color:
              isSelect ? ColorManager.primaryDark : ColorManager.primary2Color,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            if (model.icon != null)
              model.icon!.svg(
                width: 25,
                colorFilter: ColorFilter.mode(
                  !isSelect
                      ? ColorManager.primaryDark
                      : ColorManager.primary2Color,
                  BlendMode.srcIn,
                ),
              ),
            if (model.icon != null) const SizedBox(width: 8),
            Center(
              child: Text(
                model.title,
                style: Get.textTheme.bodySmall!.copyWith(
                  color:
                      isSelect
                          ? ColorManager.whiteColor
                          : ColorManager.primaryDark,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
