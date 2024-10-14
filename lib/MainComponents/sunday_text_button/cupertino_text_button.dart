import 'package:flutter/cupertino.dart';

/// A custom Cupertino-style text button for the Sunday app.
///
/// This widget provides a customizable text button that follows the iOS design
/// guidelines and integrates well with the Sunday app's aesthetics.
class CupertinoTextButton extends StatelessWidget {
  /// The text to display inside the button.
  final String text;

  /// The callback that is called when the button is tapped or otherwise activated.
  final VoidCallback onPressed;

  /// The color to use for the button's background.
  final Color? color;

  /// The text style to use for the button's text.
  final TextStyle? textStyle;

  /// The font size to use for the button's text.
  final double? fontSize;

  /// The font weight to use for the button's text.
  final FontWeight? fontWeight;

  /// The padding to use for the button's content.
  final EdgeInsetsGeometry? padding;

  /// The color to use for the button's background when it is disabled.
  final Color? disabledColor;

  /// The focus node to use for the button.
  final FocusNode? focusNode;

  /// Whether the button should be focused as soon as it is visible.
  final bool autofocus;

  /// How to align the button's content.
  final AlignmentGeometry alignment;

  /// The minimum size to use for the button.
  final double? minSize;

  /// The opacity to use for the button when it is pressed.
  final double? pressedOpacity;

  /// The border radius to use for the button's corners.
  final BorderRadius? borderRadius;

  /// The widget to display inside the button.
  final Widget? child;

  /// Creates a [CupertinoTextButton].
  ///
  /// The [text] and [onPressed] parameters must not be null.
  const CupertinoTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textStyle,
    this.fontSize,
    this.fontWeight,
    this.padding,
    this.disabledColor,
    this.focusNode,
    this.autofocus = false,
    this.alignment = Alignment.center,
    this.minSize = kMinInteractiveDimensionCupertino,
    this.pressedOpacity = 0.4,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: padding,
      onPressed: onPressed,
      color: color,
      disabledColor: disabledColor ?? CupertinoColors.systemGrey,
      focusNode: focusNode,
      autofocus: autofocus,
      alignment: alignment,
      minSize: minSize,
      pressedOpacity: pressedOpacity,
      borderRadius: borderRadius,
      child: child ?? Container(),
    );
  }
}

