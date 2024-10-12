import 'package:flutter/cupertino.dart';

class CupertinoScaffold extends StatelessWidget {
  const CupertinoScaffold({
    super.key,
    this.navigationBar,
    required this.child,
    required this.resizeToAvoidBottomInset,
    this.backgroundColor,
  });

  final ObstructingPreferredSizeWidget? navigationBar;
  final Widget child;
  final bool resizeToAvoidBottomInset;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: navigationBar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      backgroundColor: backgroundColor,
      child: child,
    );
  }
}
