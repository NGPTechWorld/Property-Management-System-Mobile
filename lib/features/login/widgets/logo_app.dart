import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/features/login/login_controller.dart';

class LogoApp extends GetView<LoginController> {
  const LogoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.07),
      child: Center(
        child: Assets.images.logo.image(
          height: MediaQuery.sizeOf(context).height * 0.3,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
