import 'package:flutter/material.dart';
import '../assets.gen.dart';
import '../color_manager.dart';
import '../values_manager.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
    required this.hint,
    required this.controller,
    this.onChanged,
    this.suffixIcon,
    this.fillColor,
  });

  final String hint;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      style: TextStyle(fontSize: FontSize.s14, fontWeight: FontWeight.w400),
      cursorHeight: 20,
      cursorColor: ColorManager.colorPrimary,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        constraints: const BoxConstraints(minHeight: 55),
        hintText: hint,
        hintStyle: TextStyle(
          color: ColorManager.colorDoveGray300,
          fontWeight: FontWeight.w400,
          fontSize: FontSize.s14,
        ),
        suffixIcon: suffixIcon,
        prefixIcon: UnconstrainedBox(
          child: Assets.icons.searchIcon.svg(width: 24, height: 24),
        ),
        contentPadding: const EdgeInsets.all(0),
        filled: true,
        fillColor: fillColor ?? ColorManager.colorWhite,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
      ),
      onTapOutside: (PointerDownEvent event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}
