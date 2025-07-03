import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AppPadding {
  static const double p2 = 2.0;
  static const double p4 = 4.0;
  static const double p6 = 6.0;
  static const double p8 = 8.0;
  static const double p10 = 10.0;
  static const double p12 = 12.0;
  static const double p14 = 14.0;
  static const double p16 = 16.0;
  static const double p18 = 18.0;
  static const double p20 = 20.0;
  static const double p24 = 24.0;
  static const double p28 = 28.0;
  static const double p50 = 50.0;
  static const double p100 = 100.0;
}

abstract class AppSize {
  static const double s0 = 0;
  static const double s1 = 1;
  static const int s2 = 2;
  static const double s1_5 = 1.5;
  static const double s4 = 4.0;
  static const double s8 = 8.0;
  static const double s10 = 10.0;
  static const double s12 = 12.0;
  static const double s14 = 14.0;
  static const double s16 = 16.0;
  static const double s18 = 18.0;
  static const double s20 = 20.0;
  static const double s22 = 22.0;
  static const double s24 = 24.0;
  static const double s26 = 26.0;
  static const double s28 = 28.0;
  static const double s30 = 28.0;
  static const double s34 = 34.0;
  static const double s40 = 40.0;
  static const double s60 = 60.0;
  static const double s90 = 90.0;
  static const double s100 = 100.0;
  static const double s120 = 120.0;
  static const double s140 = 140.0;
  static const double s160 = 160.0;
  static const double s190 = 190.0;
  static double sWidth = MediaQuery.sizeOf(Get.context!).width;
  static double sHeight = MediaQuery.sizeOf(Get.context!).height;
  static double sStatusBarHeight = MediaQuery.of(Get.context!).padding.top;
}

abstract class FontSize {
  static double get s10 => _AdaptiveFontSize.getFontSize(10);
  static double get s11 => _AdaptiveFontSize.getFontSize(11);
  static double get s12 => _AdaptiveFontSize.getFontSize(12);
  static double get s13 => _AdaptiveFontSize.getFontSize(13);
  static double get s14 => _AdaptiveFontSize.getFontSize(14);
  static double get s15 => _AdaptiveFontSize.getFontSize(15);
  static double get s16 => _AdaptiveFontSize.getFontSize(16);
  static double get s17 => _AdaptiveFontSize.getFontSize(17);
  static double get s18 => _AdaptiveFontSize.getFontSize(18);
  static double get s19 => _AdaptiveFontSize.getFontSize(19);
  static double get s20 => _AdaptiveFontSize.getFontSize(20);
  static double get s22 => _AdaptiveFontSize.getFontSize(22);
  static double get s24 => _AdaptiveFontSize.getFontSize(24);
  static double get s28 => _AdaptiveFontSize.getFontSize(28);
  static double get s30 => _AdaptiveFontSize.getFontSize(30);
  static double get s36 => _AdaptiveFontSize.getFontSize(36);
  static double get s50 => _AdaptiveFontSize.getFontSize(50);
}

class _AdaptiveFontSize {
  static double getFontSize(double baseFontSize) {
    if (Get.context == null) return baseFontSize;
    double screenWidth = MediaQuery.sizeOf(Get.context!).width;
    const double baseScreenWidth = 375.0; // Standard screen width
    double scaleFactor = screenWidth / baseScreenWidth;
    return baseFontSize * scaleFactor;
  }
}
