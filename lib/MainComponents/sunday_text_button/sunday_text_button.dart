import 'package:flutter/widgets.dart';
import 'package:sunday_platform/MainComponents/sunday_text_button/cupertino_text_button.dart';
import 'package:sunday_platform/MainComponents/sunday_text_button/fluent_text_button.dart';
import 'package:sunday_platform/MainComponents/sunday_text_button/material_text_button.dart';
import 'package:sunday_platform/style.dart';

/// A custom text button that adapts to different styles (Material, Cupertino, etc.)
class SundayTextButton extends StatelessWidget {
  /// The callback that is called when the button is tapped or otherwise activated.
  final VoidCallback onPressed;

  /// The color to use for the button's background.
  final Color? color;

  /// The text style to use for the button's text.
  final TextStyle? textStyle;

  /// The style of the button (Material, Cupertino, etc.).
  final Style style;

  /// The child widget to display inside the button.
  final Widget child;

  /// The padding to use for the button.
  final EdgeInsetsGeometry? padding;

  /// Creates a [SundayTextButton].
  ///
  /// The [text], [onPressed], [style], and [child] parameters must not be null.
  const SundayTextButton({
    super.key,
    required this.onPressed,
    this.color,
    this.textStyle,
    required this.style,
    required this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    switch (style) {
      case Style.fluent:
        return FluentTextButton(
          onPressed: onPressed,
          child: child,
        );
      case Style.yaru:
      case Style.material:
        return MaterialTextButton(
          onPressed: onPressed,
          color: color,
          textStyle: textStyle,
          padding: padding,
          child: child,
        );
      case Style.macos:
      case Style.cupertino:
      case Style.latestIOS:
        return CupertinoTextButton(
          onPressed: onPressed,
          color: color,
          textStyle: textStyle,
          padding: padding,
          child: child,
        );
    }
  }
}
