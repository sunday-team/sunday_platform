import 'package:flutter/material.dart';
import 'package:sunday_core/Print/print.dart';
import 'package:sunday_platform/config/sunday_color_theme.dart';
import 'package:sunday_platform/sunday_platform.dart';

/// Configuration class for Sunday app styling and behavior
class SundayConfig {
  /// Creates a new configuration instance
  const SundayConfig({
    required this.uiStyle,
    required this.colorTheme
  });

  /// The UI style for the application
  final Style uiStyle;
  final SundayColorTheme colorTheme;

  /// Create a new config with overridden properties
  SundayConfig copyWith({
    Style? uiStyle,
    SundayColorTheme? colorTheme,
  }) {
    return SundayConfig(
      uiStyle: uiStyle ?? this.uiStyle,
      colorTheme: colorTheme ?? this.colorTheme
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SundayConfig && 
           other.uiStyle == uiStyle &&
           other.colorTheme == colorTheme;
  }

  @override
  int get hashCode => Object.hash(uiStyle, colorTheme);
}

/// A widget that provides [SundayConfig] to all descendants.
class SundayConfigWidget extends InheritedWidget {
  /// Creates a widget that provides [SundayConfig] to its descendants.
  const SundayConfigWidget({
    super.key,
    required this.config,
    this.inheritFromParent = true,
    required super.child,
  });

  /// The configuration to use for descendant widgets.
  final SundayConfig config;

  /// Whether to inherit and merge values from parent config.
  /// If false, this config will completely replace the parent config.
  final bool inheritFromParent;

  /// Gets the configuration from the closest [SundayConfigWidget] ancestor.
  static SundayConfig of(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<SundayConfigWidget>();
    if (provider == null) {
      throw FlutterError.fromParts(<DiagnosticsNode>[
        ErrorSummary(
            'SundayConfigWidget.of() called with a context that does not contain a SundayConfigWidget.'),
        ErrorDescription(
            'No SundayConfigWidget ancestor could be found starting from the context that was passed to SundayConfigWidget.of().',
        ),
        ErrorHint(
            'Make sure to wrap your app or widget tree with a SundayConfigWidget to provide configuration.'),
        context.describeElement('The context used was'),
      ]);
    }
    return provider.config;
  }

  /// Gets the current configuration from the closest [SundayConfigWidget] ancestor without
  /// registering for rebuilds.
  static SundayConfig? maybeOf(BuildContext context) {
    final element = context.getElementForInheritedWidgetOfExactType<SundayConfigWidget>();
    if (element == null) return null;
    final widget = element.widget as SundayConfigWidget;
    return widget.config;
  }

  @override
  bool updateShouldNotify(SundayConfigWidget oldWidget) =>
      config != oldWidget.config ||
      inheritFromParent != oldWidget.inheritFromParent;
}

/// A convenience widget for creating sections with a different style
class SundayStyledSection extends StatelessWidget {
  /// Creates a section with a specific style configuration
  const SundayStyledSection({
    super.key,
    required this.style,
    required this.child,
    SundayColorTheme? colorTheme,
  }) : _colorTheme = colorTheme;

  /// The style to use for this section
  final Style style;
  
  /// The child widget
  final Widget child;
  
  /// Optional color theme override
  final SundayColorTheme? _colorTheme;

  @override
  Widget build(BuildContext context) {
    // Get parent configuration if available
    final parentConfig = SundayConfigWidget.maybeOf(context);
    
    return SundayConfigWidget(
      config: SundayConfig(
        uiStyle: style,
        colorTheme: _colorTheme ?? parentConfig?.colorTheme ?? SundayColorTheme(
          backgroundColor: SColor(dark: Colors.blue, light: Colors.blue),
          textColor: SColor(dark: Colors.white, light: Colors.black),
          subTitleTextColor: SColor(dark: Colors.grey[300]!, light: Colors.grey[700]!),
          borderColor: SColor(dark: Colors.grey[300]!, light: Colors.grey[700]!),
          backgroundElementColor: SColor(dark: Colors.grey[300]!, light: Colors.grey[700]!)
        )
      ),
      child: child,
    );
  }
}