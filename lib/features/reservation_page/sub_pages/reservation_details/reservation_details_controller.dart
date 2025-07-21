import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReservationDetailsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void onInit() {
    tabController = TabController(length: tabs.length, vsync: this);
    super.onInit();
  }

  final tabs = ["الفواتير الحالية", "الفواتير السابقة"];
}
