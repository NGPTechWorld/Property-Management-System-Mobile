import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/features/tourisem_page/widgets/all_tourisem.dart';
import 'package:property_ms/features/tourisem_page/widgets/tourisem_slider_widget.dart';
import 'package:property_ms/features/widgets/app_bar_search.dart';
import 'package:property_ms/features/widgets/card_filter.dart';

import 'tourisem_controller.dart';

class TourisemPage extends GetView<TourisemController> {
  const TourisemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        //! @OsamaZerkawi add refresh
        onRefresh: () async {},
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: controller.scrollAllTourismController,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarTourisem(),
              SizedBox(height: AppSize.s8),
              TourisemSliderWidget(),
              AllTourisem(),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBarTourisem extends GetView<TourisemController> {
  const AppBarTourisem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: AppSize.sWidth,
              height: 170 + AppSize.sStatusBarHeight,

              decoration: BoxDecoration(
                color: ColorManager.lightPrimaryColor,
                border: Border.all(color: ColorManager.primary6Color),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Obx(
                    () => Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: List.generate(
                        controller.cardFilter.length,
                        (index) => GestureDetector(
                          onTap: () {
                            controller.selectFilter(index);
                          },
                          child: CardFilter(
                            model: controller.cardFilter[index],
                            isSelect:
                                controller.selectedFilterIndex.value == index,
                          ),
                        ),
                      ),
                    ),
                  ),
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
          controller: controller.searchController,
        ),
      ],
    );
  }
}
