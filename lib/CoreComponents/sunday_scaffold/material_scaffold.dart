import 'package:flutter/material.dart';

class MaterialScaffold extends StatefulWidget {
  const MaterialScaffold({super.key, required this.appBar, required this.body, required this.resizeToAvoidBottomInset});

  final AppBar? appBar;
  final Widget? body;
  final bool resizeToAvoidBottomInset;

  @override
  State<MaterialScaffold> createState() => _MaterialScaffoldState();
}

class _MaterialScaffoldState extends State<MaterialScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      body: widget.body,
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
    );
  }
}