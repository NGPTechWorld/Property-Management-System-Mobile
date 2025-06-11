import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

//! get System Ui Overlay Style:
SystemUiOverlayStyle getSystemUiOverlayStyle(Brightness currentBrightness, BuildContext context) {
  return currentBrightness == Brightness.light ? SystemUiOverlayStyle.light.copyWith(systemNavigationBarColor: Theme.of(context).colorScheme.surface, systemNavigationBarIconBrightness: Brightness.dark, statusBarColor: Theme.of(context).colorScheme.inversePrimary) : SystemUiOverlayStyle.dark.copyWith(statusBarColor: Theme.of(context).colorScheme.inversePrimary, systemNavigationBarColor: Theme.of(context).colorScheme.surface, systemNavigationBarIconBrightness: Brightness.light);
}

//! pick Image:
Future<XFile?> pickImage() async {
  final ImagePicker picker = ImagePicker();
  final image = await picker.pickImage(source: ImageSource.gallery); // or ImageSource.camera
  return image;
}

//! upload Image To Api:
Future uploadImageToApi(XFile? image) async {
  if (image == null) return null;
  return MultipartFile.fromFile(image.path, filename: image.path.split('/').last);
}

//! log navigator stack:
class RouteObserverService extends NavigatorObserver {
  final List<String> routeHistory = [];

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    log('Pushed route: ${route.settings.name}');
    routeHistory.add(route.settings.name ?? 'Unknown');
    printRouteHistory();
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    log('Popped route: ${route.settings.name}');
    routeHistory.removeLast();
    printRouteHistory();
  }

  void printRouteHistory() {
    log('Current navigation stack:');
    for (var route in routeHistory) {
      log(route);
    }
  }
}

bool isRtl(BuildContext context) {
  final textDirection = Directionality.of(context);
  final isRtl = textDirection == TextDirection.rtl;
  return isRtl;
}
 

//! we don't create functions without class around them
