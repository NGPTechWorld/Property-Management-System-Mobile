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
    return GetMaterialApp(
      translations: AppTranslations(),
      useInheritedMediaQuery: true,
      locale: const Locale('ar'),
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
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: const TextScaler.linear(1.0)),
          child: DevicePreview.appBuilder(context, child),
        );
      },
    );
  }
}
