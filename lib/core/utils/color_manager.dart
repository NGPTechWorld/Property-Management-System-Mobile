import 'package:flutter/material.dart';

abstract class ColorManager {
  static const Color colorPrimary = Color(0xff9B1724);
  static const Color colorPrimary2 = Color(0xFFBF4034);
  static const Color colorSecondary = Color(0xff0f4c6a);
  static const Color colorSecondary2 = Color(0xff1e6bce);

  // static const Color colorPrimary = Color(0xff232F3E);
  // static const Color colorPrimary2 = Color(0xbf232f3e);
  // static const Color colorSecondary = Color(0xffFF9900);
  // static const Color colorSecondary2 = Color(0xbfff9900);

  static const Color colorSecondaryRed = Color(0xFFF02A18);
  static const Color colorSecondaryBlue = Color(0xFF146EB4);
  static const Color colorSecondaryYalow = Color(0xFFF0B418);
  static const Color colorSecondaryGrey = Color(0xFFF2F2F2);

  static const Color colorBackground = Color(0xfff3f2f7);

  static const Color colorFontPrimary = Color(0xFF000000);
  static const Color colorFontSecondary = Color(0xFF292828);

  static const Color colorDivider = Color(0xFFE9E9E9);

  static const Color colorSuccess50 = Color(0xFFF1FCF3);
  static const Color colorSuccess500 = Color(0xFF34C759);

  static const Color colorDoveGray50 = Color(0xFFF8F7F7);
  static const Color colorDoveGray100 = Color(0xFFDCDADA);
  static const Color colorDoveGray300 = Color(0xFFBEBBBB);
  static const Color colorDoveGray600 = Color(0xFF726E6E);
  static const Color colorDoveGray800 = Color(0xFF474545);
  static const Color colorDoveGray900 = Color(0xFF3E3C3C);
  static const Color colorDoveGray950 = Color(0xFF292828);

  static const Color colorError500 = Color(0xFFFF3B30);
  static const Color colorRed = Color(0xFF9B1724);
  static const Color colorToast = Color(0xFFFFFFFF);

  static const Color colorTextField = Color(0xFFFAFAFA);

  static const Color colorPlaceHolder = Color(0xFFC4C5C4);

  static const Color colorCard = Color(0xFFE7E7E7);

  static const Color colorSplash = Color(0x000ffbbb);

  static const Color colorTextFieldFill = Color(0xFFF7F8F9);
  static Color colorTextFieldFillError = const Color(
    0xFFBF4034,
  ).withValues(alpha: 0.08);
  static Color colorTextFieldEnabledBorder = colorPlaceHolder;
  static Color colorTextFieldFocusedBorder = colorPlaceHolder;
  static Color colorTextFieldErrorBorder = const Color(0xFFBF4034);

  static Color colorSelectedItem = const Color(
    0xFFBF4034,
  ).withValues(alpha: 0.05);

  static const Color colorGrey0 = Color(0xFFF7F8F9);
  static const Color colorGrey1 = Color(0xFFEFEFEF);
  static const Color colorGrey2 = Color(0xff797979);
  static const Color colorGrey3 = Color(0xFF474545);
  static const Color colorGrey4 = Color(0xFF777F8B);
  static const Color colorGrey5 = Color(0xFF555D68);
  static const Color colorGrey6 = Color(0xFF726E6E);
  static const Color colorGrey7 = Color(0xFFA5AEBB);
  static const Color colorNeutralGrey = Color(0xFF78808B);
  static const Color colorError = Color(0xffe61f34);
  static const Color colorRed100 = Color(0xffBF4034);
  static const Color colorError200 = Color(0xff9B1724);
  static const Color colorError300 = Color(0xffFF3B30);
  static const Color colorWhite = Color(0xffFFFFFF);
  static const Color colorBlack = Color(0xff0C0C0C);
  static const Color colorGreen = Color(0x1434C759);
  static const Color colorGreen2 = Color(0xFF191D23);
  static const Color colorGreen3 = Color(0xFF34C759);
  static const Color colorSpin = Color(0xFFFFFFFF);
  static const Color colorOrange = Color(0xFFFF9500);
  static const Color colorBlue = Color(0xFF007AFF);
  static const Color colorYellow = Color(0xFFFFCC00);
  static const Color colorMojo = Color(0xFFFDF4F3);

  static Color shimmerBaseColor = Colors.grey.shade300;
  static Color shimmerHighlightColor = Colors.grey.shade100;
  static Color shimmerBaseColorDark = Colors.grey.shade700;
  static Color shimmerHighlightColorDark = Colors.grey.shade800;
}
