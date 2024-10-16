import 'package:flutter/material.dart';

/// A custom Material-style text widget for the Sunday app.
///
/// This widget provides a customizable text widget that follows the Material design
/// guidelines and integrates well with the Sunday app's aesthetics.
class SundayMaterialText extends StatelessWidget {
  /// The text to display.
  final String text;

  /// The style to use for the text.
  final TextStyle? style;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// How visual overflow should be handled.
  final TextOverflow? overflow;

  /// An optional maximum number of lines for the text to span.
  final int? maxLines;

  /// The number of font pixels for each logical pixel.
  final double? textScaleFactor;

  /// Creates a [SundayMaterialText].
  ///
  /// The [text] parameter must not be null.
  const SundayMaterialText({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.textScaleFactor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      textScaler: textScaleFactor != null ? TextScaler.linear(textScaleFactor!) : null,
    );
  }
}
