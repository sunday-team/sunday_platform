import 'package:flutter/material.dart';

/// A custom text button widget that uses Material design.
class MaterialTextButton extends StatelessWidget {

  /// The callback that is called when the button is tapped or otherwise activated.
  final VoidCallback? onPressed;

  /// The color to use for this button's text.
  final Color? color;

  /// The text style to use for this button's text.
  final TextStyle? textStyle;

  /// The font size to use for this button's text.
  final double? fontSize;

  /// The font weight to use for this button's text.
  final FontWeight? fontWeight;

  /// The padding to use for this button's child.
  final EdgeInsetsGeometry? padding;

  /// The color to use for this button's text when the button is disabled.
  final Color? disabledColor;

  /// An optional focus node to use for this button.
  final FocusNode? focusNode;

  /// Whether this button should be focused initially.
  final bool autofocus;

  /// How to align the button's child.
  final AlignmentGeometry alignment;

  /// The minimum size of the button.
  final double? minSize;

  /// The opacity to use when the button is pressed.
  final double? pressedOpacity;

  /// The border radius to use for the button's shape.
  final BorderRadius? borderRadius;

  /// The widget below this widget in the tree.
  final Widget? child;

  /// Creates a MaterialTextButton.
  const MaterialTextButton({
    super.key,
    this.onPressed,
    this.color,
    this.textStyle,
    this.fontSize,
    this.fontWeight,
    this.padding,
    this.disabledColor,
    this.focusNode,
    this.autofocus = false,
    this.alignment = Alignment.center,
    this.minSize,
    this.pressedOpacity,
    this.borderRadius,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: color ?? Theme.of(context).primaryColor,
        backgroundColor: Colors.transparent,
        disabledForegroundColor: disabledColor ?? Theme.of(context).disabledColor,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 16.0),
        alignment: alignment,
        minimumSize: minSize != null ? Size(minSize!, minSize!) : null,
        shape: borderRadius != null ? RoundedRectangleBorder(borderRadius: borderRadius!) : null,
      ),
      focusNode: focusNode,
      autofocus: autofocus,
      child: child ?? Container(),
    );
  }
}
