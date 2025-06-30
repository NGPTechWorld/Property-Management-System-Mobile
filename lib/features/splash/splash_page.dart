import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';

import '../../core/routes/app_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    //todo: this is a placeholder:
    //! @MohamadAliAlnuaimi please check the auth state here:
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(Get.context!, AppRoutes.loginRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Assets.images.logo.image(fit: BoxFit.contain)),
    );
  }
}
