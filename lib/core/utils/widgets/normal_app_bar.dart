import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
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
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: Container(
        decoration: const BoxDecoration(
          color: ColorManager.primaryColor,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
        ),
        child: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: ColorManager.whiteColor),
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: centerTitle,
          title: customTitle ?? Text(title),
          leading:
              backIcon
                  ? InkWell(
                    onTap: onBack ?? () => Get.back(),
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
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
              child: Assets.icons.notificationIcon.svg(
                colorFilter: const ColorFilter.mode(
                  ColorManager.cardBackground,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
