import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../color_manager.dart';
import '../values_manager.dart';

class CustomTextFieldSec extends StatelessWidget {
  const CustomTextFieldSec({
    super.key,
    required this.title,
    required this.hint,
    this.icon,
    required this.textEditingController,
    required this.textInputType,
    this.suffixIcon = const SizedBox(),
    this.obscureText = false,
    this.onTap,
    this.validator,
    required this.fillColor,
    this.autoValidateMode = AutovalidateMode.disabled,
    this.maxLines = 1,
    this.minLines = 1,
    this.readOnly = false,
    this.onChanged,
    this.textInputAction = TextInputAction.next,
    this.minHeight = 40,
    this.borderRadius = 16,
    this.fontColor,
    this.fontWeight = FontWeight.w400,
    this.textAlign = TextAlign.start,
    this.focusNode,
    this.enabledBorderSide,
    this.focusedBorderSide,
    this.contentPadding,
    this.prefixConstraints = const BoxConstraints(minWidth: 0, minHeight: 0),
  });

  final String? title;
  final String hint;
  final Widget? icon;
  final TextEditingController? textEditingController;
  final TextInputType textInputType;
  final Widget suffixIcon;
  final bool obscureText;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final Color fillColor;
  final Color? fontColor;
  final FontWeight fontWeight;
  final AutovalidateMode? autoValidateMode;
  final int maxLines;
  final int minLines;
  final bool readOnly;
  final TextInputAction? textInputAction;
  final double minHeight;
  final double borderRadius;
  final TextAlign textAlign;
  final FocusNode? focusNode;
  final BoxConstraints? prefixConstraints;
  final EdgeInsets? contentPadding;
  final BorderSide? enabledBorderSide;
  final BorderSide? focusedBorderSide;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment:
          title == null ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        title != null
            ? Text(title!, style: Get.textTheme.titleMedium)
            : const SizedBox.shrink(),
        title != null ? const SizedBox(height: 8.0) : const SizedBox.shrink(),
        Container(
          alignment: title == null ? Alignment.center : null,
          constraints: BoxConstraints(minHeight: minHeight + maxLines * 25),
          child: TextFormField(
            focusNode: focusNode,
            onTap: onTap,
            readOnly: readOnly,
            validator: validator,
            onChanged: onChanged,
            textInputAction: textInputAction,
            autovalidateMode: autoValidateMode,
            obscureText: obscureText,
            controller: textEditingController,
            minLines: minLines,
            maxLines: maxLines,
            keyboardType:
                maxLines > 1 ? TextInputType.multiline : textInputType,
            style: TextStyle(
              fontSize: FontSize.s14,
              fontWeight: fontWeight,
              color: fontColor,
            ),
            textAlign: textAlign,
            cursorHeight: 20,
            cursorColor: ColorManager.colorPrimary,
            decoration: InputDecoration(
              counterText: '',
              constraints: BoxConstraints(minHeight: minHeight),
              hintText: hint,
              isDense: true,
              prefixIconConstraints: prefixConstraints,
              prefixIcon:
                  icon == null
                      ? null
                      : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: icon,
                      ),
              contentPadding: contentPadding ?? const EdgeInsets.all(14),
              suffixIcon: suffixIcon,
              suffixIconConstraints: const BoxConstraints(
                minWidth: 0,
                minHeight: 0,
              ),
              filled: true,
              fillColor: fillColor,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide:
                    enabledBorderSide ??
                    BorderSide(color: ColorManager.primary4Color),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide:
                    focusedBorderSide ??
                    BorderSide(color: ColorManager.primary4Color),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(color: ColorManager.redColor),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(color: ColorManager.redColor),
              ),
            ),
            onTapOutside: (PointerDownEvent event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
          ),
        ),
      ],
    );
  }
}
