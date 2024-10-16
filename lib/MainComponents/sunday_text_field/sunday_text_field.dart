import 'package:flutter/widgets.dart';
import 'package:sunday_ui/MainComponents/sunday_text_field/cupertino_text_field.dart';
import 'package:sunday_ui/MainComponents/sunday_text_field/material_text_field.dart';
import 'package:sunday_ui/style.dart';

/// A customizable text field that adapts to different UI styles (Material, Cupertino, etc.).
class SundayTextField extends StatelessWidget {
  /// The style to use for this text field (Material, Cupertino, etc.).
  final Style style;

  /// The controller for this text field.
  final TextEditingController? controller;

  /// Callback that is called when the text field's value changes.
  final ValueChanged<String>? onChanged;

  /// The type of keyboard to use for editing the text.
  final TextInputType? keyboardType;

  /// Whether to hide the text being edited (e.g., for passwords).
  final bool obscureText;

  /// The text or hint to display when the text field is empty.
  final String? placeholder;

  /// Additional decoration to add to the text field.
  final dynamic decoration;

  /// Creates a [SundayTextField].
  ///
  /// The [style] parameter is required and determines which style of text field to use.
  const SundayTextField({
    super.key,
    required this.style,
    this.controller,
    this.onChanged,
    this.keyboardType,
    this.obscureText = false,
    this.placeholder,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    switch (style) {
      case Style.material:
        return SundayMaterialTextField(
          controller: controller,
          onChanged: onChanged,
          keyboardType: keyboardType,
          obscureText: obscureText,
          labelText: placeholder,
          decoration: decoration,
          style: style,
        );
      case Style.cupertino:
      case Style.custom:
      case Style.latestIOS:
        return SundayCupertinoTextField(
          controller: controller,
          onChanged: onChanged,
          keyboardType: keyboardType,
          obscureText: obscureText,
          placeholder: placeholder,
          decoration: decoration,
          style: style,
        );
      default:
        throw UnimplementedError('Unsupported style: $style');
    }
  }
}
