import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:sunday_ui/style.dart';

/// A Cupertino-style text field for the Sunday UI framework.
class SundayCupertinoTextField extends StatelessWidget {
  /// Whether to enable autocorrection.
  final bool? autocorrect;

  /// A list of strings that helps the autofill service identify the type of this text input.
  final Iterable<String>? autofillHints;

  /// Whether this text field should focus itself if nothing else is already focused.
  final bool? autofocus;

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

  /// Controls the text being edited.
  final TextEditingController? controller;

  /// The color to use when painting the cursor.
  final Color? cursorColor;

  /// How tall the cursor will be.
  final double? cursorHeight;

  /// Whether the cursor will animate from fully transparent to fully opaque during each cursor blink.
  final bool? cursorOpacityAnimates;

  /// How rounded the corners of the cursor should be.
  final Radius? cursorRadius;

  /// How thick the cursor will be.
  final double? cursorWidth;

  /// Controls the BoxDecoration of the box behind the text input.
  final BoxDecoration? decoration;

  /// Determines the way that drag start behavior is handled.
  final DragStartBehavior? dragStartBehavior;

  /// Disables the text field when false.
  final bool? enabled;

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

  /// The type of keyboard to use for editing the text.
  final TextInputType? keyboardType;

  /// Configuration for the text field magnifier.
  final TextMagnifierConfiguration? magnifierConfiguration;

  /// The maximum number of characters to allow in the text field.
  final int? maxLength;

  /// Determines how the maxLength limit should be enforced.
  final MaxLengthEnforcement? maxLengthEnforcement;

  /// The maximum number of lines to show at one time, wrapping if necessary.
  final int? maxLines;

  /// The minimum number of lines to occupy when the content spans fewer lines.
  final int? minLines;

  /// Whether to hide the text being edited (e.g., for passwords).
  final bool obscureText;

  /// Character used for obscuring text if obscureText is true.
  final String? obscuringCharacter;

  /// Called when the user initiates a change to the TextField's value.
  final ValueChanged<String>? onChanged;

  /// Called when the user submits editable content.
  final VoidCallback? onEditingComplete;

  /// Called when the user indicates they are done editing the text.
  final ValueChanged<String>? onSubmitted;

  /// Called when the text field gains or loses focus.
  final ValueChanged<bool>? onFocusChange;

  /// Whether to show a clear button when not empty.
  final bool showClearButton;

  /// Called for the first tap in a series of taps.
  final GestureTapCallback? onTap;

  /// Called for each tap outside when the text field is focused.
  final TapRegionCallback? onTapOutside;

  /// Padding around the text entry area.
  final EdgeInsetsGeometry? padding;

  /// A lighter colored placeholder hint.
  final String? placeholder;

  /// The style to use for the placeholder text.
  final TextStyle? placeholderStyle;

  /// An optional Widget to display before the text.
  final Widget? prefix;

  /// Controls the visibility of the prefix widget.
  final OverlayVisibilityMode? prefixMode;

  /// Whether the text can be changed.
  final bool? readOnly;

  /// Restoration ID to save and restore the state.
  final String? restorationId;

  /// Whether iOS 14 Scribble features are enabled.
  final bool? scribbleEnabled;

  /// The ScrollController to use when vertically scrolling.
  final ScrollController? scrollController;

  /// Configures padding to edges surrounding a Scrollable.
  final EdgeInsets? scrollPadding;

  /// The ScrollPhysics to use when vertically scrolling.
  final ScrollPhysics? scrollPhysics;

  /// Optional delegate for building text selection handles.
  final TextSelectionControls? selectionControls;

  /// Controls how tall the selection highlight boxes are.
  final BoxHeightStyle? selectionHeightStyle;

  /// Controls how wide the selection highlight boxes are.
  final BoxWidthStyle? selectionWidthStyle;

  /// Whether to show cursor.
  final bool? showCursor;

  /// Whether to allow automatic dash formatting.
  final SmartDashesType? smartDashesType;

  /// Whether to allow automatic quote formatting.
  final SmartQuotesType? smartQuotesType;

  /// Configuration for spell check.
  final SpellCheckConfiguration? spellCheckConfiguration;

  /// The strut style for vertical layout.
  final StrutStyle? strutStyle;

  /// The style to use for the text being edited.
  final TextStyle? textFieldstyle;

  /// An optional Widget to display after the text.
  final Widget? suffix;

  /// Controls the visibility of the suffix widget.
  final OverlayVisibilityMode? suffixMode;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// How the text should be aligned vertically.
  final TextAlignVertical? textAlignVertical;

  /// Configures the keyboard's uppercase/lowercase selection.
  final TextCapitalization? textCapitalization;

  /// The directionality of the text.
  final TextDirection? textDirection;

  /// The type of action button for the keyboard.
  final TextInputAction? textInputAction;

  /// Controls the undo state.
  final UndoHistoryController? undoController;

  /// The style to use for this text field.
  final Style style;

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
    this.textFieldstyle,
    this.autocorrect,
    this.autofillHints,
    this.autofocus,
    this.clearButtonMode,
    this.clearButtonSemanticLabel,
    this.clipBehavior,
    this.contentInsertionConfiguration,
    this.contextMenuBuilder,
    this.cursorColor,
    this.cursorHeight,
    this.cursorOpacityAnimates,
    this.cursorRadius,
    this.cursorWidth,
    this.dragStartBehavior,
    this.enabled,
    this.enableIMEPersonalizedLearning,
    this.enableInteractiveSelection,
    this.enableSuggestions,
    this.expands,
    this.focusNode,
    this.groupId,
    this.inputFormatters,
    this.keyboardAppearance,
    this.magnifierConfiguration,
    this.maxLength,
    this.maxLengthEnforcement,
    this.maxLines,
    this.minLines,
    this.obscuringCharacter,
    this.onEditingComplete,
    this.onSubmitted,
    this.onTap,
    this.onTapOutside,
    this.padding,
    this.placeholderStyle,
    this.prefix,
    this.prefixMode,
    this.readOnly,
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
    this.suffix,
    this.suffixMode,
    this.textAlign,
    this.textAlignVertical,
    this.textCapitalization,
    this.textDirection,
    this.textInputAction,
    this.undoController,
    this.onFocusChange,
    this.showClearButton = false,
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
      style: textFieldstyle,
      placeholderStyle: placeholderStyle ??
          CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                color: CupertinoColors.placeholderText,
              ),
      autocorrect: autocorrect ?? true,
      autofillHints: autofillHints,
      autofocus: autofocus ?? false,
      clearButtonMode: clearButtonMode ?? OverlayVisibilityMode.never,
      clearButtonSemanticLabel: clearButtonSemanticLabel,
      clipBehavior: clipBehavior ?? Clip.hardEdge,
      contentInsertionConfiguration: contentInsertionConfiguration,
      contextMenuBuilder: contextMenuBuilder,
      cursorColor: cursorColor,
      cursorHeight: cursorHeight,
      cursorOpacityAnimates: cursorOpacityAnimates ?? true,
      cursorRadius: cursorRadius ?? const Radius.circular(2.0),
      cursorWidth: cursorWidth ?? 2.0,
      dragStartBehavior: dragStartBehavior ?? DragStartBehavior.start,
      enabled: enabled ?? true,
      enableIMEPersonalizedLearning: enableIMEPersonalizedLearning ?? true,
      enableInteractiveSelection: enableInteractiveSelection ?? true,
      enableSuggestions: enableSuggestions ?? true,
      expands: expands ?? false,
      focusNode: focusNode,
      inputFormatters: inputFormatters,
      keyboardAppearance: keyboardAppearance,
      maxLength: maxLength,
      maxLengthEnforcement: maxLengthEnforcement,
      maxLines: maxLines ?? 1,
      minLines: minLines,
      obscuringCharacter: obscuringCharacter ?? '•',
      onEditingComplete: onEditingComplete,
      onSubmitted: onSubmitted,
      onTap: onTap,
      onTapOutside: onTapOutside,
      padding: padding ?? const EdgeInsets.all(6.0),
      prefix: prefix,
      prefixMode: prefixMode ?? OverlayVisibilityMode.always,
      readOnly: readOnly ?? false,
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
      strutStyle: strutStyle,
      suffix: suffix,
      suffixMode: suffixMode ?? OverlayVisibilityMode.always,
      textAlign: textAlign ?? TextAlign.start,
      textAlignVertical: textAlignVertical,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      textDirection: textDirection,
      textInputAction: textInputAction,
    );
  }

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
