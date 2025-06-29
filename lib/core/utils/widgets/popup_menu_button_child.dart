import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../values_manager.dart';

class PopUpMenuButtonChild extends StatelessWidget {
  const PopUpMenuButtonChild({
    super.key,
    required this.text,
    this.icon,
    this.color,
    this.width,
  });

  final String text;
  final String? icon;
  final Color? color;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null)
          SvgPicture.asset(
            icon!,
            width: width,
            colorFilter: ColorFilter.mode(
              color ?? Theme.of(context).textTheme.labelMedium!.color!,
              BlendMode.srcIn,
            ),
          ),
        if (icon != null) const SizedBox(width: 10),
        Text(
          text,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: color,
            fontSize: FontSize.s13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
