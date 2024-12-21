import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sunday_platform/style.dart';

/// A customizable Material-style text field for the Sunday UI framework.
///
/// This widget provides a text input field with Material design styling.
/// It allows for customization of various properties such as label text,
/// hint text, and input decoration.
///
/// ## Parameters
///
/// - `labelText`: The text to display as the label for the text field.
/// - `hintText`: The text to display as a hint when the text field is empty.
/// - `controller`: A controller for managing the text being edited.
/// - `onChanged`: A callback that is called when the text field's value changes.
/// - `keyboardType`: The type of keyboard to use for editing the text.
/// - `obscureText`: Whether to hide the text being edited (e.g., for passwords).
/// - `decoration`: Additional decoration to add to the text field.
/// - `style`: The style to use for this text field (Material, Cupertino, etc.).
/// - `enabled`: Whether the text field is interactive.
/// - `readOnly`: Whether the text field is read-only.
/// - `maxLines`: The maximum number of lines for the text field.
/// - `minLines`: The minimum number of lines for the text field.
/// - `maxLength`: The maximum number of characters allowed.
/// - `textAlign`: The alignment of the text within the field.
/// - `textDirection`: The directionality of the text.
/// - `autocorrect`: Whether to enable autocorrect.
/// - `autofocus`: Whether the text field should be focused initially.
/// - `autofillHints`: A list of strings that helps the autofill service identify the type of this text input.
/// - `buildCounter`: Callback that generates a custom InputDecoration.counter widget.
/// - `canRequestFocus`: Determine whether this text field can request the primary focus.
/// - `clipBehavior`: The content will be clipped (or not) according to this option.
/// - `contentInsertionConfiguration`: Configuration of handler for media content inserted via the system input method.
/// - `contextMenuBuilder`: Builds the text selection toolbar when requested by the user.
/// - `cursorColor`: The color of the cursor.
/// - `cursorErrorColor`: The color of the cursor when the InputDecorator is showing an error.
/// - `cursorHeight`: How tall the cursor will be.
/// - `cursorOpacityAnimates`: Whether the cursor will animate from fully transparent to fully opaque during each cursor blink.
/// - `cursorRadius`: How rounded the corners of the cursor should be.
/// - `cursorWidth`: How thick the cursor will be.
/// - `dragStartBehavior`: Determines the way that drag start behavior is handled.
/// - `enableIMEPersonalizedLearning`: Whether to enable that the IME update personalized data such as typing history and user dictionary data.
/// - `enableInteractiveSelection`: Whether to enable user interface affordances for changing the text selection.
/// - `enableSuggestions`: Whether to show input suggestions as the user types.
/// - `expands`: Whether this widget's height will be sized to fill its parent.
/// - `focusNode`: Defines the keyboard focus for this widget.
/// - `groupId`: The group identifier for the TextFieldTapRegion of this text field.
/// - `ignorePointers`: Determines whether this widget ignores pointer events.
/// - `inputFormatters`: Optional input validation and formatting overrides.
/// - `keyboardAppearance`: The appearance of the keyboard.
/// - `magnifierConfiguration`: The configuration for the magnifier of this text field.
/// - `maxLengthEnforcement`: Determines how the maxLength limit should be enforced.
/// - `mouseCursor`: The cursor for a mouse pointer when it enters or is hovering over the widget.
/// - `obscuringCharacter`: Character used for obscuring text if obscureText is true.
/// - `onAppPrivateCommand`: This is used to receive a private command from the input method.
/// - `onEditingComplete`: Called when the user submits editable content (e.g., user presses the "done" button on the keyboard).
/// - `onTapAlwaysCalled`: Whether onTap should be called for every tap.
/// - `onTapOutside`: Called for each tap that occurs outside of theTextFieldTapRegion group when the text field is focused.
/// - `restorationId`: Restoration ID to save and restore the state of the text field.
/// - `scribbleEnabled`: Whether iOS 14 Scribble features are enabled for this widget.
/// - `scrollController`: The ScrollController to use when vertically scrolling the input.
/// - `scrollPadding`: Configures padding to edges surrounding a Scrollable when the Textfield scrolls into view.
/// - `scrollPhysics`: The ScrollPhysics to use when vertically scrolling the input.
/// - `selectionControls`: Optional delegate for building the text selection handles.
/// - `selectionHeightStyle`: Controls how tall the selection highlight boxes are computed to be.
/// - `selectionWidthStyle`: Controls how wide the selection highlight boxes are computed to be.
/// - `showCursor`: Whether to show cursor.
/// - `smartDashesType`: Whether to allow the platform to automatically format dashes.
/// - `smartQuotesType`: Whether to allow the platform to automatically format quotes.
/// - `spellCheckConfiguration`: Configuration that details how spell check should be performed.
/// - `statesController`: Represents the interactive "state" of this widget in terms of a set of MaterialStates, including MaterialState.disabled, MaterialState.hovered, MaterialState.error, and MaterialState.focused.
/// - `strutStyle`: The strut style used for the vertical layout.
/// - `textAlignVertical`: How the text should be aligned vertically.
/// - `toolbarOptions`: Configuration of toolbar options.
/// - `undoController`: Controls the undo state.
///
/// ## Usage
///
/// To use the `SundayMaterialTextField`, you can create an instance of it
/// in your widget tree. For example:
///
/// ```dart
/// SundayMaterialTextField(
///   labelText: 'Enter your name',
///   hintText: 'John Doe',
///   controller: myController,
///   onChanged: (value) {
///     // Handle the change
///   },
///   keyboardType: TextInputType.text,
///   obscureText: false,
///   style: Style.material,
/// )
/// ```
///
/// ## Example
///
/// Here is a complete example of how to use the `SundayMaterialTextField`
/// within a Flutter application:
///
/// ```dart
/// class MyApp extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     final TextEditingController myController = TextEditingController();
///
///     return MaterialApp(
///       home: Scaffold(
///         appBar: AppBar(title: Text('Material Text Field Example')),
///         body: Padding(
///           padding: const EdgeInsets.all(16.0),
///           child: SundayMaterialTextField(
///             labelText: 'Enter your name',
///             hintText: 'John Doe',
///             controller: myController,
///             onChanged: (value) {
///               print('Current value: $value');
///             },
///             keyboardType: TextInputType.text,
///             obscureText: false,
///             style: Style.material,
///           ),
///         ),
///       ),
///     );
///   }
/// }
/// ```
///
class SundayMaterialTextField extends StatelessWidget {
  /// The text to display as the label for the text field.
  final String? labelText;

  /// The text to display as a hint when the text field is empty.
  final String? hintText;

  /// A controller for managing the text being edited.
  final TextEditingController? controller;

  /// A callback that is called when the text field's value changes.
  final ValueChanged<String>? onChanged;

  /// The type of keyboard to use for editing the text.
  final TextInputType? keyboardType;

  /// Whether to hide the text being edited (e.g., for passwords).
  final bool obscureText;

  /// Additional decoration to add to the text field.
  final dynamic decoration;

  /// The style to use for this text field (Material, Cupertino, etc.).
  final Style style;

  /// Whether the text field is interactive.
  final bool? enabled;

  /// Whether the text field is read-only.
  final bool? readOnly;

  /// The maximum number of lines for the text field.
  final int? maxLines;

  /// The minimum number of lines for the text field.
  final int? minLines;

  /// The maximum number of characters allowed.
  final int? maxLength;

  /// The alignment of the text within the field.
  final TextAlign? textAlign;

  /// The directionality of the text.
  final TextDirection? textDirection;

  /// Whether to enable autocorrect.
  final bool? autocorrect;

  /// Whether the text field should be focused initially.
  final bool? autofocus;

  /// A list of strings that helps the autofill service identify the type of this text input.
  final Iterable<String>? autofillHints;

  /// Callback that generates a custom InputDecoration.counter widget.
  final InputCounterWidgetBuilder? buildCounter;

  /// Determine whether this text field can request the primary focus.
  final bool? canRequestFocus;

  /// The content will be clipped (or not) according to this option.
  final Clip? clipBehavior;

  /// Configuration of handler for media content inserted via the system input method.
  final ContentInsertionConfiguration? contentInsertionConfiguration;

  /// Builds the text selection toolbar when requested by the user.
  final EditableTextContextMenuBuilder? contextMenuBuilder;

  /// The color of the cursor.
  final Color? cursorColor;

  /// The color of the cursor when the InputDecorator is showing an error.
  final Color? cursorErrorColor;

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

  /// Defines the keyboard focus for this widget.
  final FocusNode? focusNode;

  /// The group identifier for the TextFieldTapRegion of this text field.
  final Object? groupId;

  /// Determines whether this widget ignores pointer events.
  final bool? ignorePointers;

  /// Optional input validation and formatting overrides.
  final List<TextInputFormatter>? inputFormatters;

  /// The appearance of the keyboard.
  final Brightness? keyboardAppearance;

  /// The configuration for the magnifier of this text field.
  final TextMagnifierConfiguration? magnifierConfiguration;

  /// Determines how the maxLength limit should be enforced.
  final MaxLengthEnforcement? maxLengthEnforcement;

  /// The cursor for a mouse pointer when it enters or is hovering over the widget.
  final MouseCursor? mouseCursor;

  /// Character used for obscuring text if obscureText is true.
  final String? obscuringCharacter;

  /// This is used to receive a private command from the input method.
  final AppPrivateCommandCallback? onAppPrivateCommand;

  /// Called when the user submits editable content (e.g., user presses the "done" button on the keyboard).
  final VoidCallback? onEditingComplete;

  /// Whether onTap should be called for every tap.
  final bool? onTapAlwaysCalled;

  /// Called for each tap that occurs outside of theTextFieldTapRegion group when the text field is focused.
  final TapRegionCallback? onTapOutside;

  /// Restoration ID to save and restore the state of the text field.
  final String? restorationId;

  /// Whether iOS 14 Scribble features are enabled for this widget.
  final bool? scribbleEnabled;

  /// The ScrollController to use when vertically scrolling the input.
  final ScrollController? scrollController;

  /// Configures padding to edges surrounding a Scrollable when the Textfield scrolls into view.
  final EdgeInsets? scrollPadding;

  /// The ScrollPhysics to use when vertically scrolling the input.
  final ScrollPhysics? scrollPhysics;

  /// Optional delegate for building the text selection handles.
  final TextSelectionControls? selectionControls;

  /// Controls how tall the selection highlight boxes are computed to be.
  final BoxHeightStyle? selectionHeightStyle;

  /// Controls how wide the selection highlight boxes are computed to be.
  final BoxWidthStyle? selectionWidthStyle;

  /// Whether to show cursor.
  final bool? showCursor;

  /// Whether to allow the platform to automatically format dashes.
  final SmartDashesType? smartDashesType;

  /// Whether to allow the platform to automatically format quotes.
  final SmartQuotesType? smartQuotesType;

  /// Configuration that details how spell check should be performed.
  final SpellCheckConfiguration? spellCheckConfiguration;

  /// The strut style used for the vertical layout.
  final StrutStyle? strutStyle;

  /// The style to use for the text being edited.
  final TextStyle? textStyle;

  /// How the text should be aligned vertically.
  final TextAlignVertical? textAlignVertical;

  /// Controls the undo state.
  final UndoHistoryController? undoController;

  /// The padding around the text field.
  final EdgeInsets? padding;

  /// Called when the user submits the text field.
  final ValueChanged<String>? onSubmitted;

  /// Called when the focus changes.
  final ValueChanged<bool>? onFocusChange;

  /// Whether to show a clear button.
  final bool showClearButton;

  /// Constructs a `SundayMaterialTextField` with the given properties.
  ///
  /// The `style` parameter is required and determines the style of the text field.
  const SundayMaterialTextField({
    super.key,
    this.labelText,
    this.hintText,
    this.controller,
    this.onChanged,
    this.keyboardType,
    this.obscureText = false,
    this.decoration,
    required this.style,
    this.enabled,
    this.readOnly,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.textAlign,
    this.textDirection,
    this.autocorrect,
    this.autofocus,
    this.autofillHints,
    this.buildCounter,
    this.canRequestFocus,
    this.clipBehavior,
    this.contentInsertionConfiguration,
    this.contextMenuBuilder,
    this.cursorColor,
    this.cursorErrorColor,
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
    this.ignorePointers,
    this.inputFormatters,
    this.keyboardAppearance,
    this.magnifierConfiguration,
    this.maxLengthEnforcement,
    this.mouseCursor,
    this.obscuringCharacter,
    this.onAppPrivateCommand,
    this.onEditingComplete,
    this.onTapAlwaysCalled,
    this.onTapOutside,
    this.restorationId,
    this.scribbleEnabled,
    this.scrollController,
    this.scrollPadding,
    this.scrollPhysics,
    this.selectionControls,
    this.selectionHeightStyle,
    this.selectionWidthStyle,
    this.showCursor,
    this.smartDashesType,
    this.smartQuotesType,
    this.spellCheckConfiguration,
    this.strutStyle,
    this.textStyle,
    this.textAlignVertical,
    this.undoController,
    this.padding,
    this.onSubmitted,
    this.onFocusChange,
    this.showClearButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        keyboardType: keyboardType,
        obscureText: obscureText,
        enabled: enabled,
        readOnly: readOnly ?? false,
        maxLines: maxLines,
        minLines: minLines,
        maxLength: maxLength,
        textAlign: textAlign ?? TextAlign.start,
        textDirection: textDirection,
        autocorrect: autocorrect ?? true,
        autofocus: autofocus ?? false,
        autofillHints: autofillHints,
        buildCounter: buildCounter,
        canRequestFocus: canRequestFocus ?? true,
        clipBehavior: clipBehavior ?? Clip.hardEdge,
        contentInsertionConfiguration: contentInsertionConfiguration,
        contextMenuBuilder: contextMenuBuilder,
        cursorColor: cursorColor,
        cursorErrorColor: cursorErrorColor,
        cursorHeight: cursorHeight,
        cursorOpacityAnimates: cursorOpacityAnimates ?? true,
        cursorRadius: cursorRadius,
        cursorWidth: cursorWidth ?? 2.0,
        dragStartBehavior: dragStartBehavior ?? DragStartBehavior.start,
        enableIMEPersonalizedLearning: enableIMEPersonalizedLearning ?? true,
        enableInteractiveSelection: enableInteractiveSelection ?? true,
        enableSuggestions: enableSuggestions ?? true,
        expands: expands ?? false,
        focusNode: focusNode,
        groupId: groupId ?? '',
        ignorePointers: ignorePointers ?? false,
        inputFormatters: inputFormatters,
        keyboardAppearance: keyboardAppearance,
        magnifierConfiguration: magnifierConfiguration,
        maxLengthEnforcement: maxLengthEnforcement,
        mouseCursor: mouseCursor,
        obscuringCharacter: obscuringCharacter ?? '•',
        onAppPrivateCommand: onAppPrivateCommand,
        onEditingComplete: onEditingComplete,
        onTapAlwaysCalled: onTapAlwaysCalled ?? false,
        onTapOutside: onTapOutside,
        restorationId: restorationId,
        scribbleEnabled: scribbleEnabled ?? true,
        scrollController: scrollController,
        scrollPadding: scrollPadding ?? const EdgeInsets.all(20.0),
        scrollPhysics: scrollPhysics,
        selectionControls: selectionControls,
        selectionHeightStyle: selectionHeightStyle ?? BoxHeightStyle.tight,
        selectionWidthStyle: selectionWidthStyle ?? BoxWidthStyle.tight,
        showCursor: showCursor,
        smartDashesType: smartDashesType,
        smartQuotesType: smartQuotesType,
        spellCheckConfiguration: spellCheckConfiguration,
        strutStyle: strutStyle,
        style: textStyle ??
            TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
            ),
        textAlignVertical: textAlignVertical,
        undoController: undoController,
        onSubmitted: onSubmitted,
        decoration: decoration ??
            InputDecoration(
              labelText: labelText,
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              filled: true,
              fillColor: Theme.of(context).colorScheme.surface,
              suffixIcon: showClearButton && controller?.text.isNotEmpty == true
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        controller?.clear();
                        onChanged?.call('');
                      },
                    )
                  : null,
            ),
      ),
    );
  }
}
