import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/services/cache/cache_keys.dart';
import 'package:property_ms/core/services/cache/cache_service.dart';
import 'package:property_ms/core/utils/fonts.gen.dart';

class AppTranslations extends Translations {
  static late Map<String, Map<String, String>> _keysMap;

  @override
  Map<String, Map<String, String>> get keys => _keysMap;

  static Future init() async {
    final en = await rootBundle.loadString('assets/lang/en.json');
    final ar = await rootBundle.loadString('assets/lang/ar.json');

    _keysMap = {
      'en': Map<String, String>.from(json.decode(en)),
      'ar': Map<String, String>.from(json.decode(ar)),
    };
  }

  static List<Locale> get supportedLocales => const [
    Locale('ar'),
    Locale('en'),
  ];

  static void changeLocale(String languageCode) async {
    final cacheService = Get.find<CacheService>();
    if (cacheService.getData(key: kLanguageCode) == languageCode) return;
    await cacheService.saveData(key: kLanguageCode, value: languageCode);
    await Get.updateLocale(Locale(languageCode));
    // Get.offAllNamed(AppRouter.mainRoute);
  }

  static bool get isArabic => currentLang == 'ar';

  static String get currentLang =>
      Get.find<CacheService>().getData(key: kLanguageCode);

  static String get appFontFamily => FontFamily.cairo;
}
