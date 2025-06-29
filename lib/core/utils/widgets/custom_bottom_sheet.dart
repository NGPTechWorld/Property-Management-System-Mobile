import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';

Future showCustomBottomSheet({
  required String title,
  required Widget content,
  String? iconPath,
  Color? backgroundColor,
  void Function()? iconOnPressed,
  void Function()? cancelOnPressed,
  Widget? customButton,
  double? height,
  EdgeInsetsGeometry padding = EdgeInsets.zero,
}) {
  return showModalBottomSheet(
    backgroundColor: backgroundColor ?? Get.theme.scaffoldBackgroundColor,
    elevation: 0,
    context: Get.context!,
    isScrollControlled: true,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: const ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
            ),
            child: Container(
              constraints: BoxConstraints(
                maxHeight: height ?? MediaQuery.of(context).size.height * 0.8,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppBar(
                    backgroundColor: ColorManager.colorWhite,
                    title: Text(
                      title,
                      style: Get.textTheme.headlineSmall!.copyWith(
                        color: ColorManager.colorFontPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    centerTitle: true,
                    leading: UnconstrainedBox(
                      child: CircleAvatar(
                        radius: AppSize.s18,
                        backgroundColor: ColorManager.colorDoveGray50,
                        child: IconButton(
                          onPressed:
                              cancelOnPressed ??
                              () {
                                Get.back();
                              },
                          icon: Assets.icons.cancelIcon.svg(
                            colorFilter: ColorFilter.mode(
                              ColorManager.colorDoveGray800,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    ),
                    actions: [
                      if (iconPath != null)
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: ColorManager.colorBackground,
                            child: IconButton(
                              onPressed: iconOnPressed,
                              icon: SvgPicture.asset(iconPath),
                            ),
                          ),
                        ),
                      if (customButton != null) customButton,
                    ],
                  ),
                  Container(
                    color: Theme.of(context).dividerTheme.color!,
                    height: 1,
                  ),
                  content,
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
