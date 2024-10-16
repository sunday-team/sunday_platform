// Importing necessary packages for Cupertino-style text field
import 'package:flutter/cupertino.dart';
import 'package:sunday_ui/style.dart';

// SundayCupertinoTextField is a StatelessWidget that provides a Cupertino-style text field
/// A Cupertino-style text field for the Sunday UI framework.
class SundayCupertinoTextField extends StatelessWidget {
  // Placeholder text to display when the text field is empty
  /// The text to display as a placeholder when the text field is empty.
  final String? placeholder;

  // Controller for managing the text being edited
  /// A controller for managing the text being edited.
  final TextEditingController? controller;

  // Callback that is called when the text field's value changes
  /// A callback that is called when the text field's value changes.
  final ValueChanged<String>? onChanged;

  // The type of keyboard to use for editing the text
  /// The type of keyboard to use for editing the text.
  final TextInputType? keyboardType;

  // Whether to hide the text being edited (e.g., for passwords)
  /// Whether to hide the text being edited (e.g., for passwords).
  final bool obscureText;

  // Additional decoration to add to the text field
  /// Additional decoration to add to the text field.
  final BoxDecoration? decoration;

  // The style to use for this text field (Material, Cupertino, etc.)
  /// The style to use for this text field (Material, Cupertino, etc.).
  final Style style;

  // Constructs a SundayCupertinoTextField with the given properties
  /// Constructs a SundayCupertinoTextField with the given properties.
  const SundayCupertinoTextField({
    super.key,
    this.placeholder,
    this.controller,
    this.onChanged,
    this.keyboardType,
    this.obscureText = false,
    this.decoration,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
      placeholder: placeholder,
      decoration: decoration ?? _defaultDecoration(context),
      style: CupertinoTheme.of(context).textTheme.textStyle,
      placeholderStyle: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
            color: CupertinoColors.placeholderText,
          ),
    );
  }

  // Returns the default decoration for the text field
  /// Returns the default decoration for the text field.
  BoxDecoration _defaultDecoration(BuildContext context) {
    return BoxDecoration(
      color: CupertinoColors.systemBackground.resolveFrom(context),
      border: Border.all(
        color: CupertinoColors.systemGrey.resolveFrom(context),
        width: 0.0,
      ),
      borderRadius: BorderRadius.circular(8.0),
    );
  }
}
