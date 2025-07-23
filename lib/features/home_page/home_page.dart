import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/normal_app_bar.dart';
import 'package:property_ms/data/dto/property_dto.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/features/home_page/widgets/header_home.dart';
import 'package:property_ms/features/widgets/property_rent_card.dart';
import 'package:property_ms/features/widgets/top_offices.dart';
import 'package:property_ms/features/widgets/top_services_card.dart';
import 'package:shimmer/shimmer.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: const NormalAppBar(title: "الصفحة الرئيسة"),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.refreshPage();
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderHome(),
              const TopProperty(),
              TopOffice(controller: controller),
              TopServices(controller: controller),
            ],
          ),
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

class TopProperty extends GetView<HomeController> {
  const TopProperty({super.key});

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
          controller: controller.scrollTopPropertController,
          scrollDirection: Axis.horizontal,
          child: Obx(() {
            switch (controller.loadingTopPropertState.value) {
              case LoadingState.idle:
              case LoadingState.hasError:
              case LoadingState.doneWithNoData:
              case LoadingState.loading:
                return Row(
                  children: List.generate(3, (index) {
                    return Shimmer.fromColors(
                      baseColor: ColorManager.shimmerBaseColor,
                      highlightColor: ColorManager.shimmerHighlightColor,
                      child:  PropertyRentCard(
                        model: PropertyDto.empty(),
                        isLoaging: true,
                      ),
                    );
                  }),
                );
              case LoadingState.doneWithData:
                return Row(
                  children: List.generate(controller.topPropertList.length, (
                    index,
                  ) {
                    final item = controller.topPropertList[index];
                    return PropertyRentCard(model: item, isLoaging: false);
                  }),
                );
            }
          }),
        ),
        const SizedBox(height: AppSize.s16),
      ],
    );
  }
}
