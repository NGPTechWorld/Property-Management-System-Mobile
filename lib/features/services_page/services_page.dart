import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/features/services_page/widgets/all_services.dart';
import 'package:property_ms/features/services_page/widgets/top_services.dart';
import 'package:property_ms/features/widgets/app_bar_search.dart';
import 'package:property_ms/features/widgets/card_filter.dart';
import 'services_controller.dart';

class ServicesPage extends GetView<ServicesController> {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.refreshPage();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: controller.scrollAllServiceController,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarServices(),
              SizedBox(height: AppSize.s14),
              TopServices(),
              AllServices(),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBarServices extends GetView<ServicesController> {
  const AppBarServices({super.key});

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
                    controller.cardFiltter.length,
                    (index) => GestureDetector(
                      onTap: () {
                        controller.selectFilter(index);
                      },
                      child: CardFilter(
                        model: controller.cardFiltter[index],
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
          title: "مزودي الخدمات",
          onTapFilter: controller.openFilterPagePro,
          isLocation: false,
          isBack: true,
          controller: controller.searchController,
        ),
      ],
    );
  }
}
