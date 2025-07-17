import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:property_ms/core/routes/app_routes.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/features/offices_page/widgets/ads_slider_widget.dart';
import 'package:property_ms/features/widgets/app_bar_search.dart';
import 'package:property_ms/features/widgets/card_filter.dart';
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
            const AppBarOffices(),
            const AdsSliderWidget(),
            TopOffice(controller: controller),
            const AllOffices(),
          ],
        ),
      ),
    );
  }
}

class AppBarOffices extends GetView<OfficesController> {
  const AppBarOffices({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          AnimatedSize(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOutCubic,
            child: Container(
              height:
                  controller.isFiltterShow.value
                      ? 170 + AppSize.sStatusBarHeight
                      : 0,
              decoration: const BoxDecoration(
                color: ColorManager.lightPrimaryColor,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(24),
                ),
              ),
              child:
                  controller.isFiltterShow.value
                      ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: List.generate(
                            cardFilterDefault.length,
                            (index) => GestureDetector(
                              onTap: () {
                                controller.selectFilter(index);
                              },
                              child: CardFilter(
                                model: cardFilterDefault[index],
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
          AppBarSearch(
            title: "المكاتب",
            isLocation: true,
            controller: controller,
          ),
        ],
      ),
    );
  }
}

class AllOffices extends GetView<OfficesController> {
  const AllOffices({super.key});

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
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.officeDetails, arguments: item);
                  },
                  child: OfficeCardStyle2(model: item),
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: AppSize.s16),
      ],
    );
  }
}
