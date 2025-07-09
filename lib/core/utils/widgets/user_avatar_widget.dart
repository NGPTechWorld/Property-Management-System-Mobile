import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:property_ms/data/models/user_model.dart';

import '../assets.gen.dart';
import '../color_manager.dart';

class UserAvatarWidget extends StatelessWidget {
  const UserAvatarWidget({super.key, required this.user, required this.radius});

  final UserModel user;
  final double radius;

  bool _isNetworkUrl(String url) {
    return url.startsWith('http://') || url.startsWith('https://');
  }

  @override
  Widget build(BuildContext context) {
    ImageProvider imageProvider;

    if (user.image == null) {
      imageProvider = Assets.images.user.provider();
    } else if (_isNetworkUrl(user.image!)) {
      imageProvider = CachedNetworkImageProvider(user.image!);
    } else {
      if (user.image!.startsWith('/')) {
        imageProvider = FileImage(File(user.image!));
      } else {
        imageProvider = AssetImage(user.image!);
      }
    }

    return CircleAvatar(
      radius: radius,
      backgroundColor: ColorManager.white,
      backgroundImage: imageProvider,
    );
  }
}

//! Old
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:property_ms/data/models/user_model.dart';

// import '../assets.gen.dart';
// import '../color_manager.dart';
// class UserAvatarWidget extends StatelessWidget {
//   const UserAvatarWidget({super.key, required this.user, required this.radius});

//   final UserModel user;
//   final double radius;

//   bool _isNetworkUrl(String url) {
//     return url.startsWith('http://') || url.startsWith('https://');
//   }

//   @override
//   Widget build(BuildContext context) {
//     ImageProvider imageProvider;

//     if (user.image == null) {
//       imageProvider = Assets.images.user.provider();
//     } else if (_isNetworkUrl(user.image!)) {
//       imageProvider = CachedNetworkImageProvider(user.image!);
//     } else {
//       imageProvider = AssetImage(user.image!);
//     }

//     return CircleAvatar(
//       radius: radius,
//       backgroundColor: ColorManager.white,
//       backgroundImage: imageProvider,
//     );
//   }
// }
