import 'package:flutter/widgets.dart';
import 'package:sunday_ui/CoreComponents/sunday_scaffold/cupertino_scaffold.dart';
import 'package:sunday_ui/CoreComponents/sunday_scaffold/material_scaffold.dart';
import 'package:sunday_ui/Scripts/preferences/change_key.dart';
import 'package:sunday_ui/Scripts/preferences/get_key.dart';
import 'package:sunday_ui/Scripts/preferences/get_path.dart';
import 'package:sunday_ui/style.dart';

/// A scaffold widget that adapts to different UI styles (Material, Cupertino, etc.).
///
/// This widget provides a consistent structure for pages in the Sunday app,
/// adapting to the specified UI style.
class SundayScaffold extends StatefulWidget {
  /// Creates a [SundayScaffold].
  ///
  /// The [style], [appBar], and [child] parameters must not be null.
  const SundayScaffold({
    super.key,
    required this.style,
    this.resizeToAvoidBottomInset,
    this.backgroundColor,
    required this.appBar,
    required this.child,
  });

  /// The UI style to use for this scaffold.
  final Style style;

  /// Whether the [child] should resize when the keyboard appears.
  final bool? resizeToAvoidBottomInset;

  /// The background color of the scaffold.
  final Color? backgroundColor;

  /// The primary content of the scaffold.
  final Widget child;

  /// The app bar to display at the top of the scaffold.
  final dynamic appBar;

  @override
  State<SundayScaffold> createState() => _SundayScaffoldState();
}

class _SundayScaffoldState extends State<SundayScaffold> {
  @override
  void initState() {
    super.initState();
    initPlatform();
  }

  /// Initializes platform-specific settings for the scaffold.
  void initPlatform() {
    final scaffoldContext = context;
    final path = getPath(scaffoldContext);
    final backgroundColor = widget.backgroundColor?.toString();
    final resizeToAvoidBottomInset = widget.resizeToAvoidBottomInset?.toString();

    Future.microtask(() async {
      var data = await getKey(path);
      if (data is Map && mounted) {
        if (data['type'] != 'sunday_scaffold' || data.isEmpty) {
          changeKey(path, {
            "backgroundColor": backgroundColor,
            "resizeToAvoidBottomInset": resizeToAvoidBottomInset,
            "type": "sunday_scaffold",
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.style) {
      case Style.material:
        return SundayMaterialScaffold(
          appBar: widget.appBar,
          body: widget.child,
          resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset ?? true,
        );
      case Style.cupertino:
      case Style.custom:
      case Style.latestIOS:
        return SundayCupertinoScaffold(
          navigationBar: widget.appBar,
          resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset ?? true,
          backgroundColor: widget.backgroundColor,
          child: widget.child,
        );
      default:
        throw UnimplementedError('Unsupported style: ${widget.style}');
    }
  }
}
