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

  /// The strut style to use for the text.
  final StrutStyle? strutStyle;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// The directionality of the text.
  final TextDirection? textDirection;

  /// The locale used to select region-specific glyphs.
  final Locale? locale;

  /// Whether the text should break at soft line breaks.
  final bool? softWrap;

  /// How visual overflow should be handled.
  final TextOverflow? overflow;

  /// The number of font pixels for each logical pixel.
  final double? textScaleFactor;

  /// An optional maximum number of lines for the text to span.
  final int? maxLines;

  /// An optional semantic label for the text.
  final String? semanticsLabel;

  /// The width basis to use for the text.
  final TextWidthBasis? textWidthBasis;

  /// The height behavior to use for the text.
  final TextHeightBehavior? textHeightBehavior;

  /// The color to use for the text selection.
  final Color? selectionColor;

  /// Creates a [SundayMaterialText].
  ///
  /// The [text] parameter must not be null.
  const SundayMaterialText({
    super.key,
    required this.text,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      selectionColor: selectionColor,
    );
  }
}

