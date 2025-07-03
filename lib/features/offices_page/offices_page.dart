import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/custom_text_field.dart';
import 'package:property_ms/features/offices_page/widgets/ads_slider_widget.dart';
import 'package:property_ms/features/offices_page/widgets/office_card_style2.dart';
import 'package:property_ms/features/widgets/top_offices.dart';

import 'offices_controller.dart';

class OfficesPage extends GetView<OfficesController> {
  const OfficesPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OfficesController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppBarSearch(title: "المكاتب"),
            const AdsSliderWidget(),
            TopOffice(controller: controller),
            AllOffices(controller: controller),
          ],
        ),
      ),
    );
  }
}

class AllOffices extends StatelessWidget {
  const AllOffices({super.key, required this.controller});

  final OfficesController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
          child: Text(
            "كل المكاتب",
            style: Get.textTheme.headlineMedium!.copyWith(
              color: ColorManager.secColor,
            ),
          ),
        ),
        const SizedBox(height: AppSize.s18),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: List.generate(controller.topOffices.length, (index) {
              final item = controller.topOffices[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: AppPadding.p14,
                ),
                child: OfficeCardStyle2(model: item),
              );
            }),
          ),
        ),
        const SizedBox(height: AppSize.s16),
      ],
    );
  }
}

class AppBarSearch extends StatelessWidget {
  final String title;
  const AppBarSearch({super.key, required this.title});

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
            child: Padding(
              padding: const EdgeInsets.only(top: 16, right: 16),
              child: Text(
                title,
                style: Get.textTheme.headlineMedium!.copyWith(
                  color: ColorManager.whiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
                  Assets.icons.filterSvgrepoCom.svg(
                    width: 30,
                    colorFilter: const ColorFilter.mode(
                      ColorManager.whiteColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Assets.icons.mapIcon.svg(width: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
