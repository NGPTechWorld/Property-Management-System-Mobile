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
    colorScheme: ColorScheme.fromSeed(seedColor: ColorManager.colorPrimary),
    primaryColor: ColorManager.colorPrimary,
    cardColor: ColorManager.containerPrimary,
    scaffoldBackgroundColor: ColorManager.primary1Color,
    disabledColor: ColorManager.primary6Color,
    splashColor: ColorManager.containerPrimary,
    popupMenuTheme: const PopupMenuThemeData(
      surfaceTintColor: ColorManager.containerPrimary,
      shadowColor: Colors.black,
      color: ColorManager.whiteColor,
    ),
    iconTheme: const IconThemeData(color: ColorManager.primary7Color),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: ColorManager.primary7Color,
        backgroundColor: ColorManager.primary3Color,
        shadowColor: Colors.transparent,
      ),
    ),
    // Text color
    // Text color
    primaryColorLight: ColorManager.blackColor,
    primaryColorDark: ColorManager.primary6Color,
    hintColor: ColorManager.primary4Color,
    fontFamily: AppTranslations.appFontFamily,
    //TODO: change if u want
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: ColorManager.primary7Color,
        fontWeight: FontWeight.w800,
        fontSize: FontSize.s22,
      ),
      headlineMedium: TextStyle(
        color: ColorManager.primary7Color,
        fontWeight: FontWeight.w800,
        fontSize: FontSize.s18,
      ),
      headlineSmall: TextStyle(
        color: ColorManager.primary7Color,
        fontSize: FontSize.s16,
        fontWeight: FontWeight.w600,
      ),
      displayMedium: TextStyle(
        color: ColorManager.primary7Color,
        fontWeight: FontWeight.bold,
        fontSize: FontSize.s16,
      ),
      displaySmall: TextStyle(
        color: ColorManager.primary7Color,
        fontWeight: FontWeight.w600,
        fontSize: FontSize.s14,
      ),
      bodyLarge: TextStyle(
        color: ColorManager.primary7Color,
        fontWeight: FontWeight.bold,
        fontSize: FontSize.s14,
      ),
      bodyMedium: TextStyle(
        color: ColorManager.primary7Color,
        fontWeight: FontWeight.w600,
        fontSize: FontSize.s13,
      ),
      bodySmall: TextStyle(
        color: ColorManager.primary7Color,
        fontWeight: FontWeight.normal,
        fontSize: FontSize.s12,
      ),

      /// 1. title large
      titleLarge: TextStyle(
        color: ColorManager.primary7Color,
        fontWeight: FontWeight.bold,
        fontSize: FontSize.s15,
      ),
      titleMedium: TextStyle(
        color: ColorManager.primary7Color,
        fontWeight: FontWeight.bold,
        fontSize: FontSize.s13,
      ),
      //TODO: change if u want
      //I use this in small title in home page
      titleSmall: TextStyle(
        color: ColorManager.primary7Color,
        fontWeight: FontWeight.bold,
        fontSize: FontSize.s14,
      ),
      // use this in label of icons in popupmenu
      labelLarge: TextStyle(
        color: ColorManager.primary7Color,
        fontWeight: FontWeight.w600,
        fontSize: FontSize.s16,
      ),
      labelMedium: TextStyle(
        color: ColorManager.primary7Color,
        fontWeight: FontWeight.w500,
        fontSize: FontSize.s12,
      ),
      labelSmall: TextStyle(
        color: ColorManager.primary7Color,
        fontSize: FontSize.s11,
        fontWeight: FontWeight.normal,
      ),
    ),
    dividerTheme: const DividerThemeData(color: ColorManager.blackColor),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorManager.whiteColor,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorManager.colorPrimary,
      unselectedItemColor: ColorManager.blackColor,
      selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: FontSize.s12,
        color: ColorManager.colorPrimary,
      ),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.s12,
        color: ColorManager.blackColor,
      ),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: false,
      backgroundColor: ColorManager.colorPrimary,
      elevation: 0,
      iconTheme: const IconThemeData(
        color: ColorManager.primary7Color,
        size: AppSize.s20,
      ),
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: FontSize.s18,
        color: ColorManager.whiteColor,
        fontFamily: AppTranslations.appFontFamily,
      ),
    ),
    dialogTheme: DialogThemeData(backgroundColor: ColorManager.whiteColor),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: ColorManager.whiteColor,
      elevation: 1,
      weekdayStyle: TextStyle(
        color: ColorManager.primary4Color,
        fontWeight: FontWeight.bold,
        fontSize: FontSize.s16,
      ),
      dayStyle: TextStyle(
        color: ColorManager.containerPrimary,
        fontWeight: FontWeight.w600,
        fontSize: FontSize.s14,
      ),
    ),
    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorManager.whiteColor,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p16,
        vertical: AppPadding.p20,
      ),
      // hint style
      hintStyle: TextStyle(
        color: ColorManager.primary7Color,
        fontWeight: FontWeight.w500,
        fontSize: FontSize.s12,
        fontFamily: AppTranslations.appFontFamily,
      ),
      labelStyle: TextStyle(
        color: ColorManager.primary7Color,
        fontWeight: FontWeight.w500,
        fontFamily: AppTranslations.appFontFamily,
      ),
      errorStyle: TextStyle(
        color: ColorManager.redColor,
        fontWeight: FontWeight.w500,
        fontFamily: AppTranslations.appFontFamily,
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.firstDarkColor,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s10)),
      ),
      // enabled border style
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.firstDarkColor,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s10)),
      ),
      // focused border style
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.firstDarkColor,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s10)),
      ),
      // error border style
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.redColor,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s10)),
      ),
      // focused border style
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.redColor,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s10)),
      ),
    ),
  );
}
