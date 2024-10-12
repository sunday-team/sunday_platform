import 'package:flutter/widgets.dart';
import 'package:sunday_ui/CoreComponents/sunday_scaffold/cupertino_scaffold.dart';
import 'package:sunday_ui/CoreComponents/sunday_scaffold/material_scaffold.dart';
import 'package:sunday_ui/style.dart';

class SundayScaffold extends StatefulWidget {
  const SundayScaffold(
      {super.key,
      required this.style,
      this.resizeToAvoidBottomInset,
      this.backgroundColor,
      this.appBar,
      required this.child});

  final Style style;
  final bool? resizeToAvoidBottomInset;
  final Color? backgroundColor;
  final Widget child;
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

  void initPlatform() {}
  @override
  Widget build(BuildContext context) {
    switch (widget.style) {
      case Style.material:
        return MaterialScaffold(
          appBar: widget.appBar,
          body: widget.child,
          resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset ?? true,
        );
      case Style.cupertino:
      case Style.custom:
      case Style.latestIOS:
        return CupertinoScaffold(
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
