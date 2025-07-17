import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/features/property_page/widgets/property_slider_widget.dart';
import 'package:property_ms/features/widgets/app_bar_search.dart';
import 'package:property_ms/features/widgets/card_filter.dart';
import 'package:property_ms/features/widgets/property_rent_card2_small.dart';
import 'package:property_ms/features/widgets/property_sale_card2_small.dart';
import 'property_controller.dart';

class PropertyPage extends GetView<PropertyController> {
  const PropertyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarProperty(controller: controller),
            const SizedBox(height: AppSize.s8),
            const PropertySliderWidget(),
            const AllProperty(),
          ],
        ),
      ),
    );
  }
}

class AppBarProperty extends StatelessWidget {
  const AppBarProperty({super.key, required this.controller});

  final PropertyController controller;

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
                        controller.cardFilters.length,
                        (index) => GestureDetector(
                          onTap: () {
                            controller.selectFilter(index);
                          },
                          child: CardFilter(
                            model: controller.cardFilters[index],
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
        ),
      ],
    );
  }
}

class AllProperty extends GetView<PropertyController> {
  const AllProperty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
          child: Text(
            "كل العقارات",
            style: Get.textTheme.headlineMedium!.copyWith(
              color: ColorManager.secColor,
            ),
          ),
        ),
        const SizedBox(height: AppSize.s18),
        Column(
          children: List.generate(
            controller.allProperties.length,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: AppPadding.p12),
              child: _buildPropertyCard(controller.allProperties[index]),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPropertyCard(dynamic item) {
    if (item is PropertyRentCard2SmallModel) {
      return PropertyRentCard2Small(model: item);
    } else if (item is PropertySaleCard2SmallModel) {
      return PropertySaleCard2Small(model: item);
    } else {
      return const SizedBox();
    }
  }
}
