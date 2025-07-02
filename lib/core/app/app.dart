import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/translations/app_translation.dart';
import 'package:property_ms/core/themes/theme_manager.dart';
import '../routes/navigation_manager.dart';
import '../routes/app_routes.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //final cacheService = Get.find<CacheService>();
    return GetMaterialApp(
      translations: AppTranslations(),
      useInheritedMediaQuery: true,
      builder: DevicePreview.appBuilder,
      locale: const Locale('ar'),
      // locale: const Locale('en'),
      theme: LightModeTheme().themeData,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      getPages: NavigationManager.getPages,
      initialRoute: AppRoutes.mainRoute,
      fallbackLocale: const Locale('ar'),
      supportedLocales: AppTranslations.supportedLocales,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
    );
  }
}
