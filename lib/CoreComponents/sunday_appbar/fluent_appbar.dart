import 'package:fluent_ui/fluent_ui.dart';

/// A custom implementation of a Fluent-style app bar for the Sunday app.
///
/// This widget provides a customizable app bar that follows the Fluent design
/// guidelines and integrates well with the Sunday app's aesthetics.
class SundayFluentAppBar extends StatelessWidget{
  /// The primary content of the app bar.
  final Widget middle;

  /// A widget to display before the [middle] widget.
  final Widget? leading;

  /// A widget to display after the [middle] widget.
  final Widget? trailing;

  /// A list of Widgets to display in a row after the [middle] widget.
  final List<Widget>? actions;

  /// The height of the app bar.
  final double height;

  /// Creates a [SundayFluentAppBar].
  ///
  /// The [middle] argument must not be null.
  const SundayFluentAppBar({
    super.key,
    required this.middle,
    this.leading,
    this.trailing,
    this.actions,
    this.height = 52.0,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
} 