import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/reusable/profile_section_card.dart';

class LocationCard extends StatelessWidget {
  final String location;
  final Axis direction;
  final double spacing;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final double? iconSize;
  final TextStyle? textStyle;

  const LocationCard({
    super.key,
    required this.location,
    this.direction = Axis.vertical,
    this.spacing = 6,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.iconSize = 28,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final content = [
      Assets.icons.locationIcon.svg(
        width: iconSize,
        height: iconSize,
        colorFilter: const ColorFilter.mode(Colors.blueGrey, BlendMode.srcIn),
      ),
      SizedBox(
        width: direction == Axis.horizontal ? spacing : 0,
        height: direction == Axis.vertical ? spacing : 0,
      ),
      Text(
        direction == Axis.vertical
            ? location.replaceFirst(' ', '\n')
            : location,
        textAlign: TextAlign.center,
        style:
            textStyle ??
            Get.textTheme.bodyMedium?.copyWith(
              color: const Color(0xFF3F3D56),
              fontWeight: FontWeight.w600,
            ),
      ),
    ];

    return SizedBox(
      width: direction == Axis.vertical ? AppSize.s160 : null,
      child: ProfileSectionCard(
        child:
            direction == Axis.vertical
                ? Column(
                  mainAxisAlignment: mainAxisAlignment,
                  crossAxisAlignment: crossAxisAlignment,
                  children: content,
                )
                : Row(
                  mainAxisAlignment: mainAxisAlignment,
                  crossAxisAlignment: crossAxisAlignment,
                  children: content,
                ),
      ),
    );
  }
}
