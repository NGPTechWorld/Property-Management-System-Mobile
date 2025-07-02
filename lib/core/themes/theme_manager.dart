import 'package:flutter/material.dart';
import 'package:property_ms/core/translations/app_translation.dart';
import 'package:property_ms/core/utils/color_manager.dart';

import '../utils/values_manager.dart';

abstract class MainThemeApp {
  late ThemeData themeData;
}

class LightModeTheme implements MainThemeApp {
  @override
  ThemeData themeData = ThemeData(
    dividerColor: Colors.transparent,
    colorScheme: ColorScheme.fromSeed(seedColor: ColorManager.primaryColor),
    primaryColor: ColorManager.primaryColor,
    cardColor: ColorManager.cardBack2,
    scaffoldBackgroundColor: ColorManager.cardBack2,
    disabledColor: ColorManager.grey2,
    splashColor: ColorManager.cardBack2,
    popupMenuTheme: const PopupMenuThemeData(
      surfaceTintColor: ColorManager.cardBack2,
      shadowColor: Colors.black,
      color: ColorManager.white,
    ),
    iconTheme: const IconThemeData(color: ColorManager.secColor),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.grey,
        backgroundColor: ColorManager.primary3Color,
        shadowColor: Colors.transparent,
      ),
    ),
    // Text color
    primaryColorLight: ColorManager.primaryColor,
    primaryColorDark: ColorManager.primaryDark,
    hintColor: ColorManager.primaryDark,
    fontFamily: AppTranslations.appFontFamily,
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: ColorManager.secColor,
        fontWeight: FontWeight.w800,
        fontSize: FontSize.s22,
      ),
      headlineMedium: TextStyle(
        color: ColorManager.secColor,
        fontWeight: FontWeight.w800,
        fontSize: FontSize.s18,
      ),
      headlineSmall: TextStyle(
        color: ColorManager.secColor,
        fontSize: FontSize.s16,
        fontWeight: FontWeight.w600,
      ),
      displayMedium: TextStyle(
        color: ColorManager.secColor,
        fontWeight: FontWeight.bold,
        fontSize: FontSize.s16,
      ),
      displaySmall: TextStyle(
        color: ColorManager.secColor,
        fontWeight: FontWeight.w600,
        fontSize: FontSize.s14,
      ),
      bodyLarge: TextStyle(
        color: ColorManager.secColor,
        fontWeight: FontWeight.bold,
        fontSize: FontSize.s16,
      ),
      bodyMedium: TextStyle(
        color: ColorManager.secColor,
        fontWeight: FontWeight.w600,
        fontSize: FontSize.s14,
      ),
      bodySmall: TextStyle(
        color: ColorManager.secColor,
        fontWeight: FontWeight.normal,
        fontSize: FontSize.s12,
      ),
      titleLarge: TextStyle(
        color: ColorManager.secColor,
        fontWeight: FontWeight.bold,
        fontSize: FontSize.s15,
      ),
      titleMedium: TextStyle(
        color: ColorManager.secColor,
        fontWeight: FontWeight.bold,
        fontSize: FontSize.s13,
      ),
      titleSmall: TextStyle(
        color: ColorManager.secColor,
        fontWeight: FontWeight.bold,
        fontSize: FontSize.s14,
      ),
      labelLarge: TextStyle(
        color: ColorManager.secColor,
        fontWeight: FontWeight.w600,
        fontSize: FontSize.s16,
      ),
      labelMedium: TextStyle(
        color: ColorManager.secColor,
        fontWeight: FontWeight.w500,
        fontSize: FontSize.s12,
      ),
      labelSmall: TextStyle(
        color: ColorManager.secColor,
        fontSize: FontSize.s11,
        fontWeight: FontWeight.normal,
      ),
    ),
    dividerTheme: const DividerThemeData(color: ColorManager.black),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorManager.white,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorManager.primaryColor,
      unselectedItemColor: ColorManager.black,
      selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: FontSize.s12,
        color: ColorManager.primaryColor,
      ),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.s12,
        color: ColorManager.black,
      ),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: false,
      backgroundColor: ColorManager.whiteColor,
      elevation: 0,
      iconTheme: const IconThemeData(
        color: ColorManager.secColor,
        size: AppSize.s20,
      ),
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: FontSize.s18,
        color: ColorManager.cardBack2,
        fontFamily: AppTranslations.appFontFamily,
      ),
    ),
    dialogTheme: const DialogThemeData(backgroundColor: ColorManager.white),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: ColorManager.white,
      elevation: 1,
      weekdayStyle: TextStyle(
        color: ColorManager.grey3,
        fontWeight: FontWeight.bold,
        fontSize: FontSize.s16,
      ),
      dayStyle: TextStyle(
        color: ColorManager.cardBack2,
        fontWeight: FontWeight.w600,
        fontSize: FontSize.s14,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorManager.white,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p16,
        vertical: AppPadding.p20,
      ),
      hintStyle: TextStyle(
        color: ColorManager.secColor,
        fontWeight: FontWeight.w500,
        fontSize: FontSize.s12,
        fontFamily: AppTranslations.appFontFamily,
      ),
      labelStyle: TextStyle(
        color: ColorManager.secColor,
        fontWeight: FontWeight.w500,
        fontFamily: AppTranslations.appFontFamily,
      ),
      errorStyle: TextStyle(
        color: ColorManager.redColor,
        fontWeight: FontWeight.w500,
        fontFamily: AppTranslations.appFontFamily,
      ),
      disabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primaryDark,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s10)),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primaryDark,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s10)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primaryDark,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s10)),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.redColor,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s10)),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.redColor,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s10)),
      ),
    ),
  );
}
