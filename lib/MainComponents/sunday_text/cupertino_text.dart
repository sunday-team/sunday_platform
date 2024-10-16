import 'package:flutter/cupertino.dart';

/// A custom Cupertino-style text widget for the Sunday app.
///
/// This widget provides a customizable text widget that follows the iOS design
/// guidelines and integrates well with the Sunday app's aesthetics.
class SundayCupertinoText extends StatelessWidget {
  /// The text to display.
  final String text;

  /// The style to use for the text.
  final TextStyle? style;

  /// The strut style to use for the text.
  final StrutStyle? strutStyle;

  /// How the text should be aligned horizontally.
  final TextAlign textAlign;

  /// The directionality of the text.
  final TextDirection? textDirection;

  /// The locale used to select region-specific glyphs.
  final Locale? locale;

  /// Whether the text should break at soft line breaks.
  final bool softWrap;

  /// How visual overflow should be handled.
  final TextOverflow overflow;

  /// The text scaler to use for the text.
  final TextScaler textScaler;

  /// An optional maximum number of lines for the text to span.
  final int? maxLines;

  /// An optional semantic label for the text.
  final String? semanticsLabel;

  /// The width basis to use for the text.
  final TextWidthBasis textWidthBasis;

  /// The height behavior to use for the text.
  final TextHeightBehavior? textHeightBehavior;

  /// Creates a [SundayCupertinoText].
  ///
  /// The [text] parameter must not be null.
  const SundayCupertinoText({
    super.key,
    required this.text,
    this.style,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.locale,
    this.softWrap = true,
    this.overflow = TextOverflow.clip,
    this.textScaler = TextScaler.noScaling,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis = TextWidthBasis.parent,
    this.textHeightBehavior,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? CupertinoTheme.of(context).textTheme.textStyle,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      textScaler: textScaler,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
    );
  }
}
