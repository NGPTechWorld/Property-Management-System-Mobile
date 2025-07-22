import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContractDetailsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final typeContract =
      ContractTypes.fromValue(Get.parameters["typeContract"] ?? "").obs;
  late TabController tabController;

  @override
  void onInit() {
    tabController = TabController(length: tabs.length, vsync: this);
    super.onInit();
  }

  final tabs = ["الفواتير الحالية", "الفواتير السابقة"];
}

enum ContractTypes {
  rentProperty('rentProperty'),
  rentToursem('rentToursem'),
  sale('sale');

  final String code;
  const ContractTypes(this.code);

  factory ContractTypes.fromValue(String value) {
    return ContractTypes.values.firstWhere(
      (e) => e.code == value,
      orElse: () => ContractTypes.rentProperty,
    );
  }
}
