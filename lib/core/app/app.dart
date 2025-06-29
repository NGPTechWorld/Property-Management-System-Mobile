import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/services/cache/cache_keys.dart';
import 'package:property_ms/core/services/cache/cache_service.dart';
import 'package:property_ms/core/translations/app_translation.dart';
import 'package:property_ms/core/themes/theme_manager.dart';
import '../Routes/navigation_manager.dart';
import '../Routes/app_routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final cacheService = Get.find<CacheService>();
    return GetMaterialApp(
      translations: AppTranslations(),
      // useInheritedMediaQuery: true,
      // builder: DevicePreview.appBuilder,
      locale: Locale(cacheService.getData(key: kLanguageCode)),
      // locale: const Locale('en'),
      theme: LightModeTheme().themeData,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      getPages: NavigationManager.getPages,
      initialRoute: AppRoutes.splashRoute,
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
