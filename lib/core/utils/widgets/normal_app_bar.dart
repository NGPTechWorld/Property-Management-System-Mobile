import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../assets.gen.dart';
import '../values_manager.dart';

class NormalAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NormalAppBar({
    super.key,
    required this.title,
    this.centerTitle = false,
    this.onBack,
    this.actions,
    this.backIcon = false,
    this.customTitle,
  });

  final bool backIcon;
  final String title;
  final bool centerTitle;
  final Widget? customTitle;
  final List<Widget>? actions;
  final void Function()? onBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      centerTitle: centerTitle,
      title: customTitle ?? Text(title),
      leading:
          backIcon
              ? InkWell(
                onTap:
                    onBack ??
                    () {
                      Get.back();
                    },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.sWidth * 0.03,
                  ),
                  child: Assets.icons.arrowBackIcon.svg(
                    matchTextDirection: true,
                  ),
                ),
              )
              : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
