import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/routes/app_routes.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/features/home_page/home_page.dart';
import 'package:property_ms/features/services_page/widgets/service_card_style2.dart';
import 'package:property_ms/features/widgets/app_bar_search.dart';
import 'package:property_ms/features/widgets/card_filter.dart';

import 'services_controller.dart';

class ServicesPage extends GetView<ServicesController> {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarServices(controller: controller),
            const SizedBox(height: AppSize.s14),
            TopServices(controller: controller),
            AllServices(controller: controller),
          ],
        ),
      ),
    );
  }
}

class AppBarServices extends StatelessWidget {
  const AppBarServices({
    super.key,
    required this.controller,
  });

  final ServicesController controller;

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
                                    controller
                                        .selectedFilterIndex
                                        .value ==
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
            title: "مزودي الخدمات",
            controller: controller,
            isLocation: false,
            isBack: true,
          ),
        ],
      ),
    );
  }
}

class AllServices extends StatelessWidget {
  const AllServices({super.key, required this.controller});

  final ServicesController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
          child: Text(
            "كل المزودين",
            style: Get.textTheme.headlineMedium!.copyWith(
              color: ColorManager.secColor,
            ),
          ),
        ),
        const SizedBox(height: AppSize.s18),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: List.generate(controller.topServices.length, (index) {
              final item = controller.topServices[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: AppPadding.p14,
                ),
                child: GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.serviceDetails),
                  child: ServiceCardStyle2(model: item),
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
