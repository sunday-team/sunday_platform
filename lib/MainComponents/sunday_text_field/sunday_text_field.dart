import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
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

  /// Whether the text field is enabled.
  final bool enabled;

  /// Whether the text field should automatically get focus.
  final bool autofocus;

  /// The maximum number of lines for the text field.
  final int? maxLines;

  /// The minimum number of lines for the text field.
  final int? minLines;

  /// The maximum length of the text field input.
  final int? maxLength;

  /// The text alignment within the text field.
  final TextAlign textAlign;

  /// The style to apply to the text being edited.
  final TextStyle? textStyle;

  /// Padding around the text field content.
  final EdgeInsetsGeometry? padding;

  /// Called when the user submits the text field.
  final ValueChanged<String>? onSubmitted;

  /// Called when the text field gains or loses focus.
  final ValueChanged<bool>? onFocusChange;

  /// The color of the cursor.
  final Color? cursorColor;

  /// Whether the text field should show a clear button when not empty.
  final bool showClearButton;

  /// Whether to enable autocorrection.
  final bool? autocorrect;

  /// A list of strings that helps the autofill service identify the type of this text input.
  final Iterable<String>? autofillHints;

  /// Show an iOS-style clear button to clear the current text entry.
  final OverlayVisibilityMode? clearButtonMode;

  /// The semantic label for the clear button used by screen readers.
  final String? clearButtonSemanticLabel;

  /// The content will be clipped (or not) according to this option.
  final Clip? clipBehavior;

  /// Configuration of handler for media content inserted via the system input method.
  final ContentInsertionConfiguration? contentInsertionConfiguration;

  /// Builds the text selection toolbar when requested by the user.
  final EditableTextContextMenuBuilder? contextMenuBuilder;

  /// How tall the cursor will be.
  final double? cursorHeight;

  /// Whether the cursor will animate from fully transparent to fully opaque during each cursor blink.
  final bool? cursorOpacityAnimates;

  /// How rounded the corners of the cursor should be.
  final Radius? cursorRadius;

  /// How thick the cursor will be.
  final double? cursorWidth;

  /// Determines the way that drag start behavior is handled.
  final DragStartBehavior? dragStartBehavior;

  /// Whether to enable that the IME update personalized data such as typing history and user dictionary data.
  final bool? enableIMEPersonalizedLearning;

  /// Whether to enable user interface affordances for changing the text selection.
  final bool? enableInteractiveSelection;

  /// Whether to show input suggestions as the user types.
  final bool? enableSuggestions;

  /// Whether this widget's height will be sized to fill its parent.
  final bool? expands;

  /// An optional focus node to use as the focus node for this widget.
  final FocusNode? focusNode;

  /// The group identifier for the TextFieldTapRegion of this text field.
  final Object? groupId;

  /// Optional input validation and formatting overrides.
  final List<TextInputFormatter>? inputFormatters;

  /// The appearance of the keyboard.
  final Brightness? keyboardAppearance;

  /// Configuration for the text field magnifier.
  final TextMagnifierConfiguration? magnifierConfiguration;

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
    this.enabled = true,
    this.autofocus = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.textAlign = TextAlign.start,
    this.textStyle,
    this.padding,
    this.onSubmitted,
    this.onFocusChange,
    this.cursorColor,
    this.showClearButton = false,
    this.autocorrect,
    this.autofillHints,
    this.clearButtonMode,
    this.clearButtonSemanticLabel,
    this.clipBehavior,
    this.contentInsertionConfiguration,
    this.contextMenuBuilder,
    this.cursorHeight,
    this.cursorOpacityAnimates,
    this.cursorRadius,
    this.cursorWidth,
    this.dragStartBehavior,
    this.enableIMEPersonalizedLearning,
    this.enableInteractiveSelection,
    this.enableSuggestions,
    this.expands,
    this.focusNode,
    this.groupId,
    this.inputFormatters,
    this.keyboardAppearance,
    this.magnifierConfiguration,
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
          enabled: enabled,
          autofocus: autofocus,
          maxLines: maxLines,
          minLines: minLines,
          maxLength: maxLength,
          textAlign: textAlign,
          textStyle: textStyle,
          onSubmitted: onSubmitted,
          onFocusChange: onFocusChange,
          cursorColor: cursorColor,
          showClearButton: showClearButton,
          autocorrect: autocorrect,
          autofillHints: autofillHints,
          clipBehavior: clipBehavior,
          contentInsertionConfiguration: contentInsertionConfiguration,
          contextMenuBuilder: contextMenuBuilder,
          cursorHeight: cursorHeight,
          cursorOpacityAnimates: cursorOpacityAnimates,
          cursorRadius: cursorRadius,
          cursorWidth: cursorWidth,
          dragStartBehavior: dragStartBehavior,
          enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
          enableInteractiveSelection: enableInteractiveSelection,
          enableSuggestions: enableSuggestions,
          expands: expands,
          focusNode: focusNode,
          groupId: groupId,
          inputFormatters: inputFormatters,
          keyboardAppearance: keyboardAppearance,
          magnifierConfiguration: magnifierConfiguration,
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
          enabled: enabled,
          autofocus: autofocus,
          maxLines: maxLines,
          minLines: minLines,
          maxLength: maxLength,
          textAlign: textAlign,
          textFieldstyle: textStyle,
          padding: padding,
          onSubmitted: onSubmitted,
          onFocusChange: onFocusChange,
          cursorColor: cursorColor,
          showClearButton: showClearButton,
          autocorrect: autocorrect,
          autofillHints: autofillHints,
          clearButtonMode: clearButtonMode,
          clearButtonSemanticLabel: clearButtonSemanticLabel,
          clipBehavior: clipBehavior,
          contentInsertionConfiguration: contentInsertionConfiguration,
          contextMenuBuilder: contextMenuBuilder,
          cursorHeight: cursorHeight,
          cursorOpacityAnimates: cursorOpacityAnimates,
          cursorRadius: cursorRadius,
          cursorWidth: cursorWidth,
          dragStartBehavior: dragStartBehavior,
          enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
          enableInteractiveSelection: enableInteractiveSelection,
          enableSuggestions: enableSuggestions,
          expands: expands,
          focusNode: focusNode,
          groupId: groupId,
          inputFormatters: inputFormatters,
          keyboardAppearance: keyboardAppearance,
          magnifierConfiguration: magnifierConfiguration,
        );
      default:
        throw UnimplementedError('Unsupported style: $style');
    }
  }
}
