import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:property_ms/core/utils/widgets/normal_app_bar.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: NormalAppBar(title: "HomePage"), body: Container());
  }
}
