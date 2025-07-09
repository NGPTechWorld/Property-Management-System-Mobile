import 'dart:developer';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:property_ms/core/app/app.dart';
import 'package:property_ms/core/config/app_binding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  AppBinding().dependencies();
  await AppBinding.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await PushNotification.initialise();
  await getToken();
  runApp(
    DevicePreview(
      builder: (context) => const MyApp(),
      enabled: true, // enable if u want to test devices
    ),
  );
}

Future<void> getToken() async {
  final fcmToken = await FirebaseMessaging.instance.getToken();
  log('FCM Token: $fcmToken');
}
