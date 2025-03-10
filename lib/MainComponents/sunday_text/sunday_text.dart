import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sunday_platform/MainComponents/sunday_text/cupertino_text.dart';
import 'package:sunday_platform/MainComponents/sunday_text/material_text.dart';
import 'package:sunday_platform/style.dart';
import 'package:sunday_platform/sunday_config.dart';

/// A widget that displays text with different styles based on the provided [Style].
///
/// This widget supports both Material and Cupertino design languages, and can be customized
/// with various text properties.
class SundayText extends StatelessWidget {
  /// The text to display.
  final String data;

  /// The style to use for the text.
  final TextStyle? textStyle;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// How visual overflow should be handled.
  final TextOverflow? overflow;

  /// An optional maximum number of lines for the text to span, wrapping if necessary.
  final int? maxLines;

  /// The number of font pixels for each logical pixel.
  final double? textScaleFactor;

  /// The color of the text.
  final Color? textColor;

  /// Creates a [SundayText] widget.
  ///
  /// The [data] parameter is the text to display, and [style] is required.
  const SundayText(
    this.data, {
    super.key,
    this.textStyle,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.textScaleFactor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final config = SundayConfigWidget.of(context);
    switch (config.uiStyle) {
      case Style.material:
        return SundayMaterialText(
            text: data,
            style: textStyle,
            textAlign: textAlign,
            overflow: overflow,
            maxLines: maxLines,
            textScaleFactor: textScaleFactor,
            textColor: textColor);
      case Style.cupertino:
      case Style.latestIOS:
        return SundayCupertinoText(
            text: data,
            textAlign: textAlign ?? TextAlign.start,
            overflow: overflow ?? TextOverflow.clip,
            maxLines: maxLines,
            textScaler: textScaleFactor != null
                ? TextScaler.linear(textScaleFactor!)
                : TextScaler.noScaling,
            softWrap: true,
            textWidthBasis: TextWidthBasis.parent,
            style: textStyle);
      default:
        throw UnimplementedError('Unsupported style: ${config.uiStyle}');
    }
  }
}
