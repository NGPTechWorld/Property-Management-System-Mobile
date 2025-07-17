import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/features/tourisem_page/widgets/tourisem_slider_widget.dart';
import 'package:property_ms/features/widgets/app_bar_search.dart';
import 'package:property_ms/features/widgets/card_filter.dart';
import 'package:property_ms/features/widgets/tourisem_card_small.dart';
import 'tourisem_controller.dart';

class TourisemPage extends GetView<TourisemController> {
  const TourisemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarTourisem(controller: controller),
            const SizedBox(height: AppSize.s8),
            const TourisemSliderWidget(),
            const AllTourisem(),
          ],
        ),
      ),
    );
  }
}

class AppBarTourisem extends StatelessWidget {
  const AppBarTourisem({super.key, required this.controller});

  final TourisemController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Obx(
              () => AnimatedSize(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOutCubic,
                child: Container(
                  width: AppSize.sWidth,
                  height:
                      controller.isFiltterShow.value
                          ? 170 + AppSize.sStatusBarHeight
                          : 0,
                  decoration: BoxDecoration(
                    color: ColorManager.lightPrimaryColor,
                    border: Border.all(color: ColorManager.primary6Color),
                  ),
                  child:
                      controller.isFiltterShow.value
                          ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: List.generate(
                                  controller.cardFilters.length,
                                  (index) => GestureDetector(
                                    onTap: () {
                                      controller.selectFilter(index);
                                    },
                                    child: CardFilter(
                                      model: controller.cardFilters[index],
                                      isSelect:
                                          controller
                                              .selectedFilterIndex
                                              .value ==
                                          index,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                          : null,
                ),
              ),
            ),
            Obx(
              () => AnimatedSize(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOutCubic,
                child: Container(
                  width: AppSize.sWidth,
                  height: controller.isFiltterShow.value ? AppSize.s50 : 0,
                  decoration: const BoxDecoration(
                    color: ColorManager.lightPrimaryColor,
                  ),
                  child:
                      controller.isFiltterShow.value
                          ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: List.generate(
                                  controller.cardFilters.length,
                                  (index) => CardFilter(
                                    model: controller.cardFilters[index],
                                    isSelect:
                                        controller.selectedFilterIndex.value ==
                                        index,
                                  ),
                                ),
                              ),
                            ),
                          )
                          : null,
                ),
              ),
            ),
          ],
        ),

        AppBarSearch(
          title: "سياحة",
          onTapFilter: controller.openFilterPagePro,
          isLocation: true,
          isBack: true,
        ),
      ],
    );
  }
}

class AllTourisem extends GetView<TourisemController> {
  const AllTourisem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
          child: Text(
            "كل الأماكن السياحية",
            style: Get.textTheme.headlineMedium!.copyWith(
              color: ColorManager.secColor,
            ),
          ),
        ),
        const SizedBox(height: AppSize.s18),
        Column(
          children: List.generate(
            controller.allTourisems.length,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: AppPadding.p12),
              child: TourisemCardSmall(model: controller.allTourisems[index]),
            ),
          ),
        ),
      ],
    );
  }
}
