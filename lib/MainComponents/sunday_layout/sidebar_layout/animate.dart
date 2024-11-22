import 'package:flutter/widgets.dart';

/// A widget that provides an animated transition for a group of sidebar items.
///
/// The [SidebarItemGroupAnimate] widget animates its child widget based on the
/// [collapsed] state, transitioning between expanded and collapsed states over
/// a specified [animationDuration].
class SidebarItemGroupAnimate extends StatefulWidget {
  /// Creates a [SidebarItemGroupAnimate] widget.
  ///
  /// The [child] parameter must not be null. The [collapsed] parameter
  /// determines the initial state of the animation, and defaults to false.
  /// The [animationDuration] parameter specifies the duration of the animation
  /// and defaults to 200 milliseconds.
  const SidebarItemGroupAnimate({
    super.key,
    required this.child,
    this.collapsed = false,
    this.animationDuration = const Duration(milliseconds: 200),
  });

  /// The widget to be animated.
  final Widget child;

  /// Whether the widget is initially collapsed.
  final bool collapsed;

  /// The duration of the animation.
  final Duration animationDuration;

  /// Creates the mutable state for this widget.
  @override
  _SidebarItemGroupAnimateState createState() =>
      _SidebarItemGroupAnimateState();
}

/// The state class for [SidebarItemGroupAnimate].
class _SidebarItemGroupAnimateState extends State<SidebarItemGroupAnimate> {
  /// Builds the widget tree for the animation.
  @override
  Widget build(BuildContext context) {
    // Uses a TweenAnimationBuilder to animate the transition between states.
    return TweenAnimationBuilder<double>(
      // Sets the duration of the animation.
      duration: widget.animationDuration,
      // Defines the tween for the animation, transitioning between 1.0 and 0.0 based on the collapsed state.
      tween: Tween<double>(
          begin: widget.collapsed ? 1.0 : 0.0,
          end: widget.collapsed ? 0.0 : 1.0),
      // Builds the animated widget tree.
      builder: (BuildContext context, double value, Widget? child) {
        // Uses an AnimatedContainer to smoothly animate the height.
        return AnimatedContainer(
          // Sets the duration for the height animation.
          duration: widget.animationDuration,
          // Sets the height to 0 when the value is 0, otherwise allows it to be dynamic.
          height: value == 0 ? 0 : null,
          // Clips the child widget to prevent overflow.
          child: ClipRect(
            // Translates the child widget vertically based on the animation value.
            child: Transform.translate(
              offset: Offset(0, (1 - value) * -200),
              // Aligns the child widget to the top center with a height factor based on the animation value.
              child: Align(
                heightFactor: value,
                alignment: Alignment.topCenter,
                // Sets the opacity of the child widget based on the animation value.
                child: Opacity(
                  opacity: value,
                  // Wraps the child widget in a SizedBox to maintain its size.
                  child: SizedBox(
                    child: child,
                  ),
                ),
              ),
            ),
          ),
        );
      },
      // The child widget to be animated.
      child: widget.child,
    );
  }
}
