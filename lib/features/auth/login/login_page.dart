import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/screen_bottom_effect.dart';
import 'package:property_ms/features/auth/login/login_controller.dart';
import 'package:property_ms/features/auth/login/widgets/visitor_button.dart';

import '../../../core/utils/widgets/logo_app.dart';
import 'widgets/login_button.dart';
import 'widgets/login_form.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: Get.context!.height),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LogoApp(withTitle: true),
                    LoginForm(),
                    LoginButton(),
                    VisitorButton(),
                  ],
                ),
              ),
            ),
          ),
          const ScreenBottomEffect(),
        ],
      ),
    );
  }
}
