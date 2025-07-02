// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/normal_app_bar.dart';
import 'package:property_ms/features/home_page/widgets/header_home.dart';
import 'package:property_ms/features/home_page/widgets/property_rent_card.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: const NormalAppBar(title: "HomePage"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderHome(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Text(
                  "عقارات مميزة",
                  style: Get.textTheme.headlineMedium!.copyWith(
                    color: ColorManager.secColor,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    controller.propertyList.length,
                    (index) =>
                        PropertyRentCard(model: controller.propertyList[index]),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
