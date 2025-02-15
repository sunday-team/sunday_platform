import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sunday_platform/CoreComponents/sunday_app/cupertino_app.dart';
import 'package:sunday_platform/CoreComponents/sunday_app/fluent_app.dart';
import 'package:sunday_platform/CoreComponents/sunday_app/macos_app.dart';
import 'package:sunday_platform/CoreComponents/sunday_app/material_app.dart';
import 'package:sunday_platform/style.dart';

/// A customizable application widget that can switch between Material and Cupertino styles.
///
/// This widget provides a flexible foundation for building cross-platform apps
/// with a consistent look and feel, while allowing for easy switching between
/// Material and Cupertino design languages.
class SundayApp extends StatefulWidget {
  /// The widget to be displayed as the home screen of the app.
  final Widget home;

  /// The title of the app, typically displayed in the device's task switcher.
  final String title;

  /// The theme to use for the Material version of the app.
  final dynamic theme;

  /// The primary color to use for the Cupertino version of the app.
  final Color? primaryColor;

  /// The list of locales the app supports.
  final List<Locale> supportedLocales;

  /// The locale to use for the app's localized resources.
  final Locale? locale;

  /// The UI style to use (Material or Cupertino).
  final Style uiStyle;

  /// The app's top-level routing table.
  final Map<String, WidgetBuilder>? routes;

  /// The name of the first route to show.
  final String? initialRoute;

  /// A key to use for the Navigator.
  final GlobalKey<NavigatorState>? navigatorKey;

  /// A list of observers for the Navigator.
  final List<NavigatorObserver>? navigatorObservers;

  /// The route generator callback used when the app is navigating to a named route.
  final RouteFactory? onGenerateRoute;

  /// The route generator callback used when the app is navigating to an unknown route.
  final RouteFactory? onUnknownRoute;

  /// Whether to show a "DEBUG" banner in checked mode.
  final bool? debugShowCheckedModeBanner;

  /// Whether to show performance overlay.
  final bool? showPerformanceOverlay;

  /// Whether to show semantics debugger.
  final bool? showSemanticsDebugger;

  /// Whether to support dark mode.
  final bool supportDarkMode;

  /// The localization delegates for the app.
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;

  /// The locale resolution callback.
  final Locale? Function(Locale?, Iterable<Locale>)? localeResolutionCallback;

  /// The builder function for the app.
  final Widget Function(BuildContext, Widget?)? builder;

  /// Creates a SundayApp.
  ///
  /// The [home], [title], and [uiStyle] arguments must not be null.
  const SundayApp({
    super.key,
    required this.home,
    required this.title,
    this.theme,
    this.primaryColor,
    this.supportedLocales = const [
      Locale('en', ''),
      Locale('ar', ''),
      Locale('bn', ''),
      Locale('de', ''),
      Locale('es', ''),
      Locale('fr', ''),
      Locale('hi', ''),
      Locale('ja', ''),
      Locale('jv', ''),
      Locale('ko', ''),
      Locale('mr', ''),
      Locale('pt', ''),
      Locale('ru', ''),
      Locale('ta', ''),
      Locale('tr', ''),
      Locale('ur', ''),
      Locale('vi', ''),
      Locale('zh', ''),
    ],
    this.locale,
    required this.uiStyle,
    this.routes,
    this.initialRoute,
    this.navigatorKey,
    this.navigatorObservers,
    this.onGenerateRoute,
    this.onUnknownRoute,
    this.debugShowCheckedModeBanner = false,
    this.showPerformanceOverlay,
    this.showSemanticsDebugger,
    this.supportDarkMode = true,
    this.localizationsDelegates,
    this.localeResolutionCallback,
    this.builder,
  });

  @override
  State<SundayApp> createState() => _SundayAppState();
}

class _SundayAppState extends State<SundayApp> {
  @override
  Widget build(BuildContext context) {
    final Iterable<LocalizationsDelegate<dynamic>>
        effectiveLocalizationsDelegates = [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      ...?widget.localizationsDelegates,
    ];

    switch (widget.uiStyle) {
      case Style.fluent:
        return SundayFluentApp(
          theme: widget.theme ?? FluentThemeData(),
          home: widget.home,
          title: widget.title,
          routes: widget.routes ?? {},
          initialRoute: widget.initialRoute,
          navigatorKey: widget.navigatorKey,
        );
      case Style.material:
        return SundayMaterialApp(
          theme: widget.theme,
          home: widget.home,
          title: widget.title,
          routes: widget.routes,
          initialRoute: widget.initialRoute,
          navigatorKey: widget.navigatorKey,
          navigatorObservers: widget.navigatorObservers,
          onGenerateRoute: widget.onGenerateRoute,
          onUnknownRoute: widget.onUnknownRoute,
          supportedLocales: widget.supportedLocales,
          locale: widget.locale,
          debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
          showPerformanceOverlay: widget.showPerformanceOverlay,
          showSemanticsDebugger: widget.showSemanticsDebugger,
          supportDarkMode: widget.supportDarkMode,
          localizationsDelegates: effectiveLocalizationsDelegates,
          localeResolutionCallback: widget.localeResolutionCallback,
        );
      case Style.cupertino:
        return SundayCupertinoApp(
          theme: CupertinoThemeData(
            primaryColor: widget.primaryColor,
          ),
          home: widget.home,
          title: widget.title,
          routes: widget.routes,
          initialRoute: widget.initialRoute,
          navigatorKey: widget.navigatorKey,
          navigatorObservers: widget.navigatorObservers,
          onGenerateRoute: widget.onGenerateRoute,
          onUnknownRoute: widget.onUnknownRoute,
          supportedLocales: widget.supportedLocales,
          locale: widget.locale,
          debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
          showPerformanceOverlay: widget.showPerformanceOverlay,
          showSemanticsDebugger: widget.showSemanticsDebugger,
          localizationsDelegates: effectiveLocalizationsDelegates,
          localeResolutionCallback: widget.localeResolutionCallback,
        );
      case Style.latestIOS:
        return SundayCupertinoApp(
          theme: CupertinoThemeData(
            primaryColor: widget.primaryColor,
          ),
          home: widget.home,
          title: widget.title,
          routes: widget.routes,
          initialRoute: widget.initialRoute,
          navigatorKey: widget.navigatorKey,
          navigatorObservers: widget.navigatorObservers,
          onGenerateRoute: widget.onGenerateRoute,
          onUnknownRoute: widget.onUnknownRoute,
          supportedLocales: widget.supportedLocales,
          locale: widget.locale,
          debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
          showPerformanceOverlay: widget.showPerformanceOverlay,
          showSemanticsDebugger: widget.showSemanticsDebugger,
          localizationsDelegates: effectiveLocalizationsDelegates,
          localeResolutionCallback: widget.localeResolutionCallback,
        );
      case Style.macos:
        return SundayMacoOSApp(
          navigatorKey: widget.navigatorKey,
          home: widget.home,
          routes: widget.routes ?? const <String, WidgetBuilder>{},
          initialRoute: widget.initialRoute,
          onGenerateRoute: widget.onGenerateRoute,
          onUnknownRoute: widget.onUnknownRoute,
          navigatorObservers:
              widget.navigatorObservers ?? const <NavigatorObserver>[],
          builder: widget.builder,
          title: widget.title,
          locale: widget.locale,
          localizationsDelegates: effectiveLocalizationsDelegates,
          localeResolutionCallback: widget.localeResolutionCallback,
          supportedLocales: widget.supportedLocales,
          showPerformanceOverlay: widget.showPerformanceOverlay ?? false,
          showSemanticsDebugger: widget.showSemanticsDebugger ?? false,
          debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner ?? true,
        );
    }
  }
}
