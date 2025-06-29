import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:property_ms/data/models/user_model.dart';

import '../assets.gen.dart';
import '../color_manager.dart';

class UserAvatarWidget extends StatelessWidget {
  const UserAvatarWidget({super.key, required this.user, required this.radius});

  final UserModel user;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: ColorManager.colorWhite,
      backgroundImage:
          user.image == null
              ? Assets.images.user.provider()
              : CachedNetworkImageProvider(user.image!),
    );
  }
}
