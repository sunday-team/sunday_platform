import 'package:sunday_platform/style.dart';
import 'package:fluent_ui/fluent_ui.dart';

/// A custom Fluent-style text button for the Sunday app.
///
/// This widget provides a customizable text button that follows the Fluent design
/// guidelines and integrates well with the Sunday app's aesthetics.
class FluentTextButton extends StatelessWidget {
  /// The callback that is called when the button is tapped or otherwise activated.
  final VoidCallback onPressed;

  /// The color to use for the button's background.
  final Color? color;

  /// The text style to use for the button's text.
  final TextStyle? textStyle;

  /// The padding to use for the button's content.
  final EdgeInsetsGeometry? padding;

  /// The widget to display inside the button.
  final Widget child;

  /// Creates a [FluentUIButton].
  ///
  /// The [onPressed] parameter must not be null.
  const FluentTextButton({
    super.key,
    required this.onPressed,
    this.color,
    this.textStyle,
    this.padding,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return FluentTheme(
      data: FluentThemeData(),
      child: Button(
        child: child,
        onPressed: () {
          onPressed();
        },
      ),
    );
  }
}
