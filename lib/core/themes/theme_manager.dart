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
    cardColor: ColorManager.colorCard,
    scaffoldBackgroundColor: ColorManager.colorBackground,
    disabledColor: ColorManager.colorGrey1,
    splashColor: ColorManager.colorSplash,
    popupMenuTheme: const PopupMenuThemeData(
      surfaceTintColor: ColorManager.colorBackground,
      shadowColor: Colors.black,
      color: ColorManager.colorWhite,
    ),
    iconTheme: const IconThemeData(color: ColorManager.colorDoveGray800),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.grey,
        backgroundColor: ColorManager.colorGrey0,
        shadowColor: Colors.transparent,
      ),
    ),
    // Text color
    primaryColorLight: ColorManager.colorFontPrimary,
    primaryColorDark: ColorManager.colorFontSecondary,
    hintColor: ColorManager.colorPlaceHolder,
    fontFamily: AppTranslations.appFontFamily,
    //TODO: change if u want
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: ColorManager.colorFontPrimary,
        fontWeight: FontWeight.w800,
        fontSize: FontSize.s22,
      ),
      headlineMedium: TextStyle(
        color: ColorManager.colorFontPrimary,
        fontWeight: FontWeight.w800,
        fontSize: FontSize.s18,
      ),
      headlineSmall: TextStyle(
        color: ColorManager.colorDoveGray600,
        fontSize: FontSize.s16,
        fontWeight: FontWeight.w600,
      ),
      displayMedium: TextStyle(
        color: ColorManager.colorFontPrimary,
        fontWeight: FontWeight.bold,
        fontSize: FontSize.s16,
      ),
      displaySmall: TextStyle(
        color: ColorManager.colorDoveGray950,
        fontWeight: FontWeight.w600,
        fontSize: FontSize.s14,
      ),
      bodyLarge: TextStyle(
        color: ColorManager.colorDoveGray950,
        fontWeight: FontWeight.bold,
        fontSize: FontSize.s14,
      ),
      bodyMedium: TextStyle(
        color: ColorManager.colorDoveGray900,
        fontWeight: FontWeight.w600,
        fontSize: FontSize.s13,
      ),
      bodySmall: TextStyle(
        color: ColorManager.colorDoveGray600,
        fontWeight: FontWeight.normal,
        fontSize: FontSize.s12,
      ),

      /// 1. title large
      titleLarge: TextStyle(
        color: ColorManager.colorFontPrimary,
        fontWeight: FontWeight.bold,
        fontSize: FontSize.s15,
      ),
      titleMedium: TextStyle(
        color: ColorManager.colorFontPrimary,
        fontWeight: FontWeight.bold,
        fontSize: FontSize.s13,
      ),
      //TODO: change if u want
      //I use this in small title in home page
      titleSmall: TextStyle(
        color: ColorManager.colorDoveGray600,
        fontWeight: FontWeight.bold,
        fontSize: FontSize.s14,
      ),
      // use this in label of icons in popupmenu
      labelLarge: TextStyle(
        color: ColorManager.colorDoveGray950,
        fontWeight: FontWeight.w600,
        fontSize: FontSize.s16,
      ),
      labelMedium: TextStyle(
        color: ColorManager.colorDoveGray600,
        fontWeight: FontWeight.w500,
        fontSize: FontSize.s12,
      ),
      labelSmall: TextStyle(
        color: ColorManager.colorDoveGray800,
        fontSize: FontSize.s11,
        fontWeight: FontWeight.normal,
      ),
    ),
    dividerTheme: const DividerThemeData(color: ColorManager.colorDivider),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorManager.colorWhite,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorManager.colorPrimary,
      unselectedItemColor: ColorManager.colorBlack,
      selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: FontSize.s12,
        color: ColorManager.colorPrimary,
      ),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.s12,
        color: ColorManager.colorBlack,
      ),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: false,
      backgroundColor: ColorManager.colorWhite,
      elevation: 0,
      iconTheme: const IconThemeData(
        color: ColorManager.colorDoveGray800,
        size: AppSize.s20,
      ),
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: FontSize.s18,
        color: ColorManager.colorFontPrimary,
        fontFamily: AppTranslations.appFontFamily,
      ),
    ),
    dialogTheme: DialogThemeData(backgroundColor: ColorManager.colorWhite),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: ColorManager.colorWhite,
      elevation: 1,
      weekdayStyle: TextStyle(
        color: ColorManager.colorGrey3,
        fontWeight: FontWeight.bold,
        fontSize: FontSize.s16,
      ),
      dayStyle: TextStyle(
        color: ColorManager.colorFontPrimary,
        fontWeight: FontWeight.w600,
        fontSize: FontSize.s14,
      ),
    ),
    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorManager.colorWhite,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p16,
        vertical: AppPadding.p20,
      ),
      // hint style
      hintStyle: TextStyle(
        color: ColorManager.colorGrey7,
        fontWeight: FontWeight.w500,
        fontSize: FontSize.s12,
        fontFamily: AppTranslations.appFontFamily,
      ),
      labelStyle: TextStyle(
        color: ColorManager.colorFontPrimary,
        fontWeight: FontWeight.w500,
        fontFamily: AppTranslations.appFontFamily,
      ),
      errorStyle: TextStyle(
        color: ColorManager.colorError,
        fontWeight: FontWeight.w500,
        fontFamily: AppTranslations.appFontFamily,
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.colorTextFieldFocusedBorder,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s10)),
      ),
      // enabled border style
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.colorTextFieldEnabledBorder,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s10)),
      ),
      // focused border style
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.colorTextFieldFocusedBorder,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s10)),
      ),
      // error border style
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.colorTextFieldErrorBorder,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s10)),
      ),
      // focused border style
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.colorTextFieldErrorBorder,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s10)),
      ),
    ),
  );
}
