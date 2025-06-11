import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/core/utils/constants/app_images.dart';

class LogoApp extends StatelessWidget {
  const LogoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.07),
      child: Center(
        child: SvgPicture.asset(
          AppImages.logoAppSvg,
          height: MediaQuery.sizeOf(context).height * 0.2,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
