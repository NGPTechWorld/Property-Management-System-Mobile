import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/custom_text_field.dart';

class AppBarSearch extends StatelessWidget {
  final String title;
  final bool isLocation;
  final bool isBack;
  final controller;
  const AppBarSearch({
    super.key,
    required this.title,
    required this.isLocation,
    required this.controller,
    this.isBack = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120 + AppSize.sStatusBarHeight,
      decoration: const BoxDecoration(
        color: ColorManager.primaryColor,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
      ),
      child: Column(
        children: [
          SizedBox(height: AppSize.sStatusBarHeight),
          SizedBox(
            width: AppSize.sWidth,
            child: Row(
              children: [
                // IconButton(
                //   onPressed: () => Get.back(),
                //   icon: ,
                // ),
                isBack
                    ? Padding(
                      padding: const EdgeInsets.only(top: 14, right: 8),
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: const Icon(
                          Icons.close,
                          color: ColorManager.whiteColor,
                        ),
                      ),
                    )
                    : Container(),
                Padding(
                  padding: const EdgeInsets.only(top: 14, right: 16),
                  child: Text(
                    title,
                    style: Get.textTheme.headlineMedium!.copyWith(
                      color: ColorManager.whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 80,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: CustomTextField(
                      title: null,
                      hint: "بحث",
                      minHeight: 50,
                      borderRadius: 72,
                      textEditingController: TextEditingController(),
                      textInputType: TextInputType.text,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Assets.icons.searchIcon.svg(
                          colorFilter: const ColorFilter.mode(
                            ColorManager.primary5Color,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      controller.isFiltterShow.value =
                          !controller.isFiltterShow.value;
                    },
                    child: Assets.icons.filterSvgrepoCom.svg(
                      width: 30,
                      colorFilter: const ColorFilter.mode(
                        ColorManager.whiteColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),

                  isLocation ? const SizedBox(width: 8) : Container(),
                  isLocation
                      ? Assets.icons.mapIcon.svg(width: 30)
                      : Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
