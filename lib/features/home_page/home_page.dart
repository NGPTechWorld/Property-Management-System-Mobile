// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/normal_app_bar.dart';
import 'package:property_ms/features/home_page/widgets/header_home.dart';
import 'package:property_ms/features/home_page/widgets/office_card.dart';
import 'package:property_ms/features/home_page/widgets/property_rent_card.dart';
import 'package:property_ms/features/home_page/widgets/property_sale_card.dart';
import 'package:property_ms/features/home_page/widgets/services_card.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: NormalAppBar(
        title: "الصفحة الرئيسة",
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
            child: Assets.icons.notificationIcon.svg(
              colorFilter: const ColorFilter.mode(
                ColorManager.cardBackground,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
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
  const TopServices({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p14,
          ),
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
            children: List.generate(controller.topServices.length, (
              index,
            ) {
              final item = controller.topServices[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: ServicesCard(model: item),
              );
            }),
          ),
        ),
        const SizedBox(height: AppSize.s16),
      ],
    );
  }
}

class TopOffice extends StatelessWidget {
  const TopOffice({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
          child: Text(
            "أفضل المكاتب",
            style: Get.textTheme.headlineMedium!.copyWith(
              color: ColorManager.secColor,
            ),
          ),
        ),
        const SizedBox(height: AppSize.s18),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(controller.topOffices.length, (index) {
              final item = controller.topOffices[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p6),
                child: OfficeCard(model: item),
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
