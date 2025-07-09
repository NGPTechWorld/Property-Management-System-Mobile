import 'package:flutter/material.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/values_manager.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppPadding.p8,
        horizontal: AppPadding.p16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Assets.images.officePropertyCard.image(width: AppSize.sWidth),
          const SizedBox(height: AppSize.s12),
          Row(
            children: [
              Flexible(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: AppSize.sWidth * 0.75,
                      alignment: Alignment.center,
                      child: Assets.images.propertyCard.image(),
                    ),
                    const SizedBox(height: AppSize.s14),
                    Container(
                      width: AppSize.sWidth * 0.75,
                      alignment: Alignment.center,
                      child: Assets.images.tourisemCard.image(),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 2,
                child: Column(
                  children: [
                    Container(
                      height: AppSize.sHeight * 0.235,
                      alignment: Alignment.centerLeft,
                      child: Assets.images.officeServicesCard.image(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppPadding.p8),
        ],
      ),
    );
  }
}
