import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/features/auth/login/login_controller.dart';

class LogoApp extends GetView<LoginController> {
  const LogoApp({super.key, this.withTitle = false, this.sizeFactor = 0.2});
  final bool withTitle;
  final double sizeFactor;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.sizeOf(context).height * 0.07,
          ),
          child: Center(
            child: Assets.images.logo.image(
              height: AppSize.sHeight * sizeFactor,
              fit: BoxFit.contain,
            ),
          ),
        ),
        withTitle
            ? Center(
              child: Text(
                "Propoly",
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: FontSize.s30,
                ),
              ),
            )
            : const SizedBox(),
      ],
    );
  }
}
