import 'package:flutter/material.dart';

class TextAutoTooltip extends StatelessWidget {
  const TextAutoTooltip({
    super.key,
    this.text = '',
    this.tooltipText,
    this.showTooltip = true,
    this.maxLines = 1,
    this.style,
    this.textAlign = TextAlign.left,
    this.overflow = TextOverflow.ellipsis,
    this.preferBelow = false,
    this.verticalOffset,
  });

  /// Text to be displayed
  final String? text;

  /// Specifiy the text to be displayed for the tooltip (when text is overflowing)
  /// If not specified, the tooltip text will be the original text displayed.
  final String? tooltipText;

  /// Specify whether to display the tooltip when overflowing, or not.
  final bool showTooltip;

  /// maxLine for the text to be displayed in
  final int? maxLines;

  /// Style of the text
  final TextStyle? style;

  /// Text alignment
  final TextAlign? textAlign;

  /// Text type of overflow
  final TextOverflow? overflow;

  /// Whether the tooltip defaults to being displayed below the widget.
  final bool? preferBelow;

  /// Tooltip verticalOffset
  final double? verticalOffset;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) {
        // Creation of a TextSpan
        TextSpan span = TextSpan(
          text: text,
          style: style,
        );

        // Creation of a TextPainter which will be used to determine whether there is an overflow or not (in fact when max lines will be exceeded)
        TextPainter tp = TextPainter(
          maxLines:
              maxLines, // to be accurate when the device scales font sizes up (or down)
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr,
          text: span,
        );

        // The TextPainter is linked to the layout
        tp.layout(maxWidth: size.maxWidth);

        // Then we get back the overflow info from the TextPainter "didExceedMaxLines" property
        bool isOnOverflow = tp.didExceedMaxLines;

        return Tooltip(
          message: isOnOverflow && showTooltip ? tooltipText ?? text : '',
          verticalOffset: verticalOffset,
          preferBelow: preferBelow,
          child: Text.rich(
            span,
            overflow: overflow,
            maxLines: maxLines,
            textAlign: textAlign,
          ),
        );
      },
    );
  }
}
