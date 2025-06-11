import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    super.key,
    required this.svgSrc,
    required this.numOfItems,
    required this.press,
  });

  final String svgSrc;
  final int numOfItems;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(50),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            // padding: EdgeInsets.all(SizeConfig.relativeHeight(12, context)),
            // height: SizeConfig.relativeWidth(46, context),
            height: 46,
            width: 46,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: Center(
              child: SvgPicture.asset(
                // ignore: deprecated_member_use
                color: Theme.of(context).colorScheme.onInverseSurface,
                svgSrc,
                height: 24,
                width: 24,
              ),
            ),
          ),
          if (numOfItems != 0)
            Positioned(
              right: -5,
              top: -5,
              child: Container(
                // padding: EdgeInsets.all(SizeConfig.relativeWidth(2, context)),
                padding: const EdgeInsets.all(2),
                constraints: const BoxConstraints(
                  // minHeight: SizeConfig.relativeWidth(22, context),
                  // minWidth: SizeConfig.relativeWidth(22, context),
                  minHeight: 18,
                  minWidth: 20,
                ),
                // height: SizeConfig.relativeWidth(16, context),
                decoration: BoxDecoration(
                  // color: kPrimaryColor,
                  // color: Colors.white,
                  // borderRadius: BorderRadius.circular(SizeConfig.relativeWidth(40, context)),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(width: 1.5, color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    '$numOfItems',
                    style: TextStyle(
                      // fontSize: SizeConfig.relativeWidth(9, context),
                      fontSize: 9,
                      // height: SizeConfig.relativeWidth(1.1, context),
                      // height: 1,
                      // color: Colors.white,
                      color: Theme.of(context).colorScheme.onInverseSurface,
                      leadingDistribution: TextLeadingDistribution.even,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
