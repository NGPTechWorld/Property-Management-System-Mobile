import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../color_manager.dart';
import '../values_manager.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.iconPath,
    required this.onPressed,
    this.iconColor,
    this.loadingMode = false,
  });

  final String iconPath;
  final void Function() onPressed;
  final Color? iconColor;
  final bool loadingMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 42,
      height: 42,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: ColorManager.colorPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          side: BorderSide(color: Theme.of(context).dividerTheme.color!),
          padding: EdgeInsets.zero,
        ),
        onPressed: onPressed,
        child:
            loadingMode
                ? const Center(
                  child: SpinKitThreeBounce(
                    color: ColorManager.redColor,
                    size: AppSize.s14,
                  ),
                )
                : SvgPicture.asset(
                  iconPath,
                  colorFilter:
                      iconColor != null
                          ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
                          : null,
                ),
      ),
    );
  }
}
