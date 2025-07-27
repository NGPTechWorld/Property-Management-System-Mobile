import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/features/property_page/widgets/all_property.dart';
import 'package:property_ms/features/property_page/widgets/promote_property.dart';
import 'package:property_ms/features/widgets/app_bar_search.dart';
import 'package:property_ms/features/widgets/card_filter.dart';
import 'property_controller.dart';

class PropertyPage extends GetView<PropertyController> {
  const PropertyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.refreshPage();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: controller.scrollAllPropertController,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarProperty(),
              SizedBox(height: AppSize.s8),
              
              PromoteProperty(),
              AllProperty(),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBarProperty extends GetView<PropertyController> {
  const AppBarProperty({super.key});

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
                            controller.searchController.text = "";
                            controller.refreshPage();
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
          title: "عقارات",
          onTapFilter: controller.openFilterPagePro,
          isLocation: true,
          isBack: true,
          controller: controller.searchController,
        ),
      ],
    );
  }
}
