import 'package:flutter/material.dart';
import 'package:property_ms/core/translations/localization_service.dart';
import 'core/app/app.dart';
import 'core/utils/services/service_locator.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initApp();

  final savedLocale = await LocalizationService.loadSavedLocale();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/langs',
      fallbackLocale: const Locale('en'),
      startLocale: savedLocale,
      child: const MyApp(),
    ),
  );
}
