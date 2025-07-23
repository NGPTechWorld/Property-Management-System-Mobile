import 'dart:developer';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:property_ms/core/app/app.dart';
import 'package:property_ms/core/config/app_binding.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  AppBinding().dependencies();
  await AppBinding.init();
  Stripe.publishableKey =
      'pk_test_51RRWQY06D6FmvGT4dqW0A34yH45MTIDe4hveJ1xx1urwPE3PJB6utgLtYFpfVc1UlIve5EerS45AAyn7heo1J2v700VQMzruXM'; // حط المفتاح تبعك

  await Stripe.instance.applySettings();

  runApp(
    DevicePreview(
      builder: (context) => const MyApp(),
      enabled: false, // enable if u want to test devices
    ),
  );
}

Future<void> getToken() async {
  final fcmToken = await FirebaseMessaging.instance.getToken();
  log('FCM Token: $fcmToken');
}
