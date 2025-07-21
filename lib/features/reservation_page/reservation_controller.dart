import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';

class ReservationController extends GetxController {
  final pageIndex = 0.obs;
  ScrollController scrollController = ScrollController();

  void selectTabScreen(int key) {
    pageIndex.value = key;
    //pageController.jumpToPage(key);
  }

  final navButtons = {
    "الإيجارات العقارية": Assets.icons.property,
    "الإيجارات السياحية": Assets.icons.tourisem,
  };
}
