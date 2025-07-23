import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/app_button.dart';
import 'package:property_ms/core/utils/widgets/normal_app_bar.dart';
import 'package:property_ms/features/home_page/widgets/header_home.dart';
import 'package:property_ms/features/widgets/property_rent_card.dart';
import 'package:property_ms/features/widgets/property_sale_card.dart';
import 'package:property_ms/features/widgets/top_offices.dart';
import 'package:property_ms/features/widgets/top_services_card.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: const NormalAppBar(title: "الصفحة الرئيسة"),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderHome(),
            TopProperty(controller: controller),
            TopOffice(controller: controller),
            TopServices(controller: controller),
          ],
        ),
      ),
    );
  }
}

class TopServices extends StatelessWidget {
  const TopServices({super.key, required this.controller});

  final controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
          child: Text(
            "أفضل الخدمات",
            style: Get.textTheme.headlineMedium!.copyWith(
              color: ColorManager.secColor,
            ),
          ),
        ),
        const SizedBox(height: AppSize.s18),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(controller.topServices.length, (index) {
              final item = controller.topServices[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: TopServicesCard(model: item),
              );
            }),
          ),
        ),
        const SizedBox(height: AppSize.s16),
      ],
    );
  }
}

class TopProperty extends StatelessWidget {
  const TopProperty({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
          child: Text(
            "عقارات مميزة",
            style: Get.textTheme.headlineMedium!.copyWith(
              color: ColorManager.secColor,
            ),
          ),
        ),
        const SizedBox(height: AppSize.s18),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(controller.propertyList.length, (index) {
              final item = controller.propertyList[index];

              if (item is PropertyRentCardModel) {
                return PropertyRentCard(model: item);
              } else if (item is PropertySaleCardModel) {
                return PropertySaleCard(model: item);
              } else {
                return const SizedBox();
              }
            }),
          ),
        ),
        const SizedBox(height: AppSize.s16),
      ],
    );
  }
}
