import 'package:flutter/material.dart';

abstract class ColorManager {
  // Primary Colors
  static const Color primaryColor = Color(0xff30B0C7);
  static const Color lightPrimaryColor = Color(0xffC3DFED);
  static const Color primaryDark = Color(0xff234F68);

  // Secondary Colors
  static const Color secColor = Color(0xff252B5C);
  static const Color secLightColor = Color(0xffDCE1FF);

  // Card Colors
  static const Color cardBackground = Color(0xffF5F4F8);
  static const Color cardBack2 = Color(0xffEFF4F6);
  static const Color cardHead = Color(0xff3D468F);

  // Other Colors
  static const Color yello = Color(0xffECAA00);
  static const Color white = Color(0xffFFFFFF);
  static const Color black = Color(0xff000000);
  static const Color grey = Color(0xffEDEDED);
  static const Color textColor1 = Color(0xff53587A);
  static const Color grey2 = Color(0xffD9D9D9);
  static const Color grey3 = Color(0xff919191);
  static const Color redColor = Color(0xffc32f27);
  static const Color greenColor = Color(0xff43aa8b);
  static const Color transparentColor = Colors.transparent;

  // Reused References
  // static const Color logoColor = primaryColor;
  // static const Color firstDarkColor = primaryDark;
  // static const Color firstLightColor = lightPrimaryColor;
  // static const Color middileColor = primaryDark;
  // static const Color secoundColor = secColor;
  // static const Color secoundLightColor = secLightColor;

  // static const Color primary1Color = cardBackground;
  // static const Color primary2Color = cardBack2;
  // static const Color primary3Color = grey2;
  // static const Color primary4Color = grey3;
  // static const Color primary5Color = textColor1;
  // static const Color primary6Color = cardHead;
  // static const Color primary7Color = secColor;

  // static const Color containerPrimary = cardBack2;
  // static const Color containerSec = cardBackground;

  // static const Color backgroundColor = white;
  // static const Color textColor = textColor1;

  // Material Grey Shades
  static Color greyColor100 = Colors.grey.shade100;
  static Color greyColor300 = Colors.grey.shade300;

  // Shimmer Colors
  static Color shimmerBaseColor = Colors.grey.shade300;
  static Color shimmerHighlightColor = Colors.grey.shade100;
  static Color shimmerBaseColorDark = Colors.grey.shade700;
  static Color shimmerHighlightColorDark = Colors.grey.shade800;
}
