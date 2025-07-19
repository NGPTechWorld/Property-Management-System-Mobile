import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/widgets/app_button.dart';
import 'package:property_ms/core/utils/widgets/normal_app_bar.dart';
import 'profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return Scaffold(
      appBar: const NormalAppBar(title: "الملف الشخصي"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: AppButton(
            text: "تسجيل الخروج",
            backgroundColor: ColorManager.grey3,
            onPressed: () => controller.logout(),
          ),
        ),
      ),
    );
  }
}
