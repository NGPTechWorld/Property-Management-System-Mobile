import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';

import './tourism_details_controller.dart';

class TourismDetailsPage extends GetView<TourismDetailsController> {
  const TourismDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.tourism.title),
        backgroundColor: ColorManager.primaryColor,
      ),
      body: Container(),
    );
  }
}
