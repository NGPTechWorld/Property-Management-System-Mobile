import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/features/offices_page/widgets/ads_slider_widget.dart';
import 'package:property_ms/features/offices_page/widgets/all_offices.dart';
import 'package:property_ms/features/offices_page/widgets/top_offices.dart';
import 'package:property_ms/features/widgets/app_bar_search.dart';
import 'package:property_ms/features/widgets/card_filter.dart';
import 'offices_controller.dart';

class OfficesPage extends GetView<OfficesController> {
  const OfficesPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OfficesController());
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.refreshPage();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: controller.scrollAllOfficeController,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarOffices(),
              AdsSliderWidget(),
              TopOffices(),
              AllOffices(),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBarOffices extends GetView<OfficesController> {
  const AppBarOffices({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: AppSize.sWidth,
          height: 170 + AppSize.sStatusBarHeight,
          decoration: const BoxDecoration(
            color: ColorManager.lightPrimaryColor,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Obx(
                () => Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: List.generate(
                    cardFilterDefault.length,
                    (index) => GestureDetector(
                      onTap: () {
                        controller.selectFilter(index);
                      },
                      child: CardFilter(
                        model: cardFilterDefault[index],
                        isSelect: controller.selectedFilterIndex.value == index,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        AppBarSearch(
          title: "المكاتب",
          isLocation: true,
          onTapFilter: controller.openFilterPagePro,
          controller: controller.searchController,
        ),
      ],
    );
  }
}
