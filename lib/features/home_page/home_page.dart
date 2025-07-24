import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/widgets/normal_app_bar.dart';
import 'package:property_ms/features/home_page/widgets/header_home.dart';
import 'package:property_ms/features/home_page/widgets/top_property_home.dart';
import 'package:property_ms/features/home_page/widgets/top_services_home.dart';
import 'package:property_ms/features/home_page/widgets/top_tourisem_home.dart';
import 'package:property_ms/features/home_page/widgets/top_offices_home.dart';
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
        child: const SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderHome(),
              TopPropertyHome(),
              TopTourisemHome(),
              TopOfficesHome(),
              TopServicesHome(),
            ],
          ),
        ),
      ),
    );
  }
}
