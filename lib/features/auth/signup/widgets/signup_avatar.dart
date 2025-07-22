import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/widgets/user_avatar_widget.dart';
import 'package:property_ms/data/models/user_model.dart';

import '../signup_controller.dart';

class SignupAvatar extends StatelessWidget {
  const SignupAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignupController>();
    return GestureDetector(
      onTap: controller.pickImage,
      child: Obx(() {
        final image = controller.image.value;
        return Center(
          child: UserAvatarWidget(
            user: UserModel(image: image?.path ?? Assets.images.user2.path),
            radius: 48,
          ),
        );
      }),
    );
  }
}
