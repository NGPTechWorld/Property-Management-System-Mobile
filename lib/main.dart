import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:property_ms/core/app/app.dart';
import 'package:property_ms/core/config/app_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  AppBinding().dependencies();
  await AppBinding.init();

  runApp(
    DevicePreview(
      builder: (context) => const MyApp(),
      enabled: false, // enable if u want to test devices
    ),
  );
}
