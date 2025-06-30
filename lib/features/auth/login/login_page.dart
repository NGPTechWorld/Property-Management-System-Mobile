import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/features/auth/login/login_controller.dart';

import 'widgets/login_button.dart';
import 'widgets/login_form.dart';
import 'widgets/logo_app.dart';

class LoginPage extends GetView<LoginController> {
  
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [LogoApp(), LoginForm(), LoginButton(),],
          ),
        ),
      ),
    );
  }
}
