import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.color,
    this.disabledColor,
    this.disabled = false,
    this.foregroundColor = Colors.white,
    this.borderRadius = 12,
    this.fontWeight = FontWeight.bold,
    this.iconPath,
    this.iconSize,
    this.icon,
    this.applyIconColor = true,
  }) : assert(
         iconPath == null || icon == null,
         'Cannot provide both iconPath and icon',
       );

  final String text;
  final void Function()? onPressed;
  final double? width;
  final double? height;
  final Color? color;
  final Color? disabledColor;
  final bool disabled;
  final Color? foregroundColor;
  final double borderRadius;
  final FontWeight fontWeight;
  final String? iconPath;
  final double? iconSize;
  final IconData? icon;
  final bool applyIconColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bgColor =
        disabled
            ? (disabledColor ?? theme.colorScheme.tertiary)
            : (color ?? theme.colorScheme.primary);
    final fgColor = foregroundColor ?? Colors.white;

    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;

          // Responsive font size: 12 to 18, based on width
          final responsiveFontSize = (maxWidth * 0.14).clamp(12.0, 18.0);

          // Responsive icon size: 12 to 28, based on width
          final responsiveIconSize = (maxWidth * 0.06).clamp(12.0, 28.0);

          final actualIconSize = iconSize ?? responsiveIconSize;

          // Build icon widget (SVG or Icon)
          final Widget? builtIcon =
              iconPath != null
                  ? SvgPicture.asset(
                    iconPath!,
                    width: actualIconSize,
                    height: actualIconSize,
                    colorFilter:
                        applyIconColor
                            ? ColorFilter.mode(fgColor, BlendMode.srcIn)
                            : null,
                  )
                  : icon != null
                  ? Icon(icon, size: actualIconSize, color: fgColor)
                  : null;

          // Padding relative to size
          final horizontalPadding = maxWidth * 0.1; // 10% of width
          final verticalPadding = (height ?? 56) * 0.25; // 25% of height

          return ElevatedButton(
            onPressed: disabled ? null : onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: bgColor,
              foregroundColor: fgColor,
              disabledBackgroundColor:
                  disabledColor ?? theme.colorScheme.tertiary,
              disabledForegroundColor: theme.colorScheme.onTertiary,
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding.clamp(16.0, 40.0),
                vertical: verticalPadding.clamp(8.0, 16.0),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              elevation: 2,
            ),
            child:
                builtIcon != null
                    ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        builtIcon,
                        SizedBox(width: maxWidth * 0.05), // spacing 5% width
                        Flexible(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              text,
                              style: TextStyle(
                                fontWeight: fontWeight,
                                fontSize: responsiveFontSize,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    )
                    : FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        text,
                        style: TextStyle(
                          fontWeight: fontWeight,
                          fontSize: responsiveFontSize,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
          );
        },
      ),
    );
  }
}
