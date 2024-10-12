import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sunday_core/GetGtorage/get_storage.dart';
import 'package:sunday_core/Print/print.dart';

enum SundayUIStyle {
  material,
  cupertino,
}

class SundayApp extends StatefulWidget {
  final Widget home;
  final String title;
  final ThemeData? theme;
  final Color? primaryColor;
  final Iterable<Locale>? supportedLocales;
  final Locale? locale;
  final SundayUIStyle uiStyle;
  final Map<String, WidgetBuilder>? routes;
  final String? initialRoute;
  final GlobalKey<NavigatorState>? navigatorKey;
  final List<NavigatorObserver>? navigatorObservers;
  final RouteFactory? onGenerateRoute;
  final RouteFactory? onUnknownRoute;
  final bool debugShowCheckedModeBanner;
  final bool showPerformanceOverlay;
  final bool showSemanticsDebugger;

  const SundayApp({
    super.key,
    required this.home,
    required this.title,
    this.theme,
    this.primaryColor,
    this.supportedLocales,
    this.locale,
    this.uiStyle = SundayUIStyle.material,
    this.routes,
    this.initialRoute,
    this.navigatorKey,
    this.navigatorObservers,
    this.onGenerateRoute,
    this.onUnknownRoute,
    this.debugShowCheckedModeBanner = false,
    this.showPerformanceOverlay = false,
    this.showSemanticsDebugger = false,
  });

  @override
  State<SundayApp> createState() => _SundayAppState();
}

class _SundayAppState extends State<SundayApp> {
  var resetUI = false;
  @override
  void initState() {
    super.initState();
    uiChanges();
  }

  void uiChanges() {
    final box = SundayGetStorage();
    Stream<bool?> resetUIStream = box.listenKey<bool>('resetUI');
    resetUIStream.listen((newResetUI) {
      if (newResetUI != null) {
        setState(() {
          resetUI = !resetUI;
        });
        sundayPrint('ResetUI changed to: $resetUI');
      } else {
        sundayPrint('ResetUI was removed');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final universalTheme = widget.theme ??
        ThemeData(
          primaryColor: widget.primaryColor ?? Colors.blue,
        );

    final commonProperties = {
      'home': widget.home,
      'title': widget.title,
      'routes': widget.routes,
      'initialRoute': widget.initialRoute,
      'navigatorKey': widget.navigatorKey,
      'navigatorObservers':
          widget.navigatorObservers ?? const <NavigatorObserver>[],
      'onGenerateRoute': widget.onGenerateRoute,
      'onUnknownRoute': widget.onUnknownRoute,
      'supportedLocales': widget.supportedLocales ?? const [Locale('en', 'US')],
      'locale': widget.locale,
      'debugShowCheckedModeBanner': widget.debugShowCheckedModeBanner,
      'showPerformanceOverlay': widget.showPerformanceOverlay,
      'showSemanticsDebugger': widget.showSemanticsDebugger,
    };

    if (widget.uiStyle == SundayUIStyle.material) {
      return MaterialApp(
        theme: universalTheme,
        home: commonProperties['home'] as Widget?,
        title: commonProperties['title'] as String,
        routes:
            (commonProperties['routes'] as Map<String, WidgetBuilder>?) ?? {},
        initialRoute: commonProperties['initialRoute'] as String?,
        navigatorKey:
            commonProperties['navigatorKey'] as GlobalKey<NavigatorState>?,
        navigatorObservers:
            commonProperties['navigatorObservers'] as List<NavigatorObserver>,
        onGenerateRoute: commonProperties['onGenerateRoute'] as RouteFactory?,
        onUnknownRoute: commonProperties['onUnknownRoute'] as RouteFactory?,
        supportedLocales:
            commonProperties['supportedLocales'] as Iterable<Locale>,
        locale: commonProperties['locale'] as Locale?,
        debugShowCheckedModeBanner:
            commonProperties['debugShowCheckedModeBanner'] as bool,
        showPerformanceOverlay:
            commonProperties['showPerformanceOverlay'] as bool,
        showSemanticsDebugger:
            commonProperties['showSemanticsDebugger'] as bool,
      );
    } else {
      return CupertinoApp(
        theme: CupertinoThemeData(
          primaryColor: universalTheme.primaryColor,
        ),
        home: commonProperties['home'] as Widget?,
        title: commonProperties['title'] as String,
        routes:
            (commonProperties['routes'] as Map<String, WidgetBuilder>?) ?? {},
        initialRoute: commonProperties['initialRoute'] as String?,
        navigatorKey:
            commonProperties['navigatorKey'] as GlobalKey<NavigatorState>?,
        navigatorObservers:
            commonProperties['navigatorObservers'] as List<NavigatorObserver>,
        onGenerateRoute: commonProperties['onGenerateRoute'] as RouteFactory?,
        onUnknownRoute: commonProperties['onUnknownRoute'] as RouteFactory?,
        supportedLocales:
            commonProperties['supportedLocales'] as Iterable<Locale>,
        locale: commonProperties['locale'] as Locale?,
        debugShowCheckedModeBanner:
            commonProperties['debugShowCheckedModeBanner'] as bool,
        showPerformanceOverlay:
            commonProperties['showPerformanceOverlay'] as bool,
        showSemanticsDebugger:
            commonProperties['showSemanticsDebugger'] as bool,
      );
    }
  }
}
