import 'package:flutter/material.dart';

/// A customizable Material-style application widget for Sunday UI.
///
/// This widget is the root of your Material-style application and provides
/// various configuration options for theming, routing, and debugging.
class SundayMaterialApp extends StatelessWidget {
  /// The theme to use for the application.
  final ThemeData? theme;

  /// The widget for the default route of the app (the first screen shown).
  final Widget home;

  /// The title of the app, typically shown in the operating system's task switcher.
  final String title;

  /// The application's top-level routing table.
  final Map<String, WidgetBuilder>? routes;

  /// The name of the first route to show.
  final String? initialRoute;

  /// A key to use when building the application.
  final GlobalKey<NavigatorState>? navigatorKey;

  /// The list of observers for the navigation events.
  final List<NavigatorObserver>? navigatorObservers;

  /// Called to generate a route for a given [RouteSettings].
  final RouteFactory? onGenerateRoute;

  /// Called when [onGenerateRoute] fails to generate a route.
  final RouteFactory? onUnknownRoute;

  /// The list of locales that this app supports.
  final Iterable<Locale>? supportedLocales;

  /// The current locale for the app's localizations.
  final Locale? locale;

  /// Turns on a little "DEBUG" banner in checked mode to indicate that the app is in checked mode.
  final bool? debugShowCheckedModeBanner;

  /// Turns on a performance overlay.
  final bool? showPerformanceOverlay;

  /// Turns on a overlay that shows the accessibility information reported by the framework.
  final bool? showSemanticsDebugger;

  /// Whether to support dark mode.
  final bool supportDarkMode;

  /// The delegates for this app's [Localizations] widget.
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;

  /// The callback that determines the app's locale when the app is started.
  final LocaleResolutionCallback? localeResolutionCallback;

  /// Creates a [SundayMaterialApp].
  ///
  /// At least the [home] and [title] arguments must be non-null.
  const SundayMaterialApp({
    super.key,
    this.theme,
    required this.home,
    required this.title,
    this.routes,
    this.initialRoute,
    this.navigatorKey,
    this.navigatorObservers,
    this.onGenerateRoute,
    this.onUnknownRoute,
    this.supportedLocales,
    this.locale,
    this.debugShowCheckedModeBanner,
    this.showPerformanceOverlay,
    this.showSemanticsDebugger,
    this.supportDarkMode = false, // Default to false
    this.localizationsDelegates,
    this.localeResolutionCallback,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: theme?.primaryColor,
        // Add other theme properties as needed
      ),
      darkTheme: supportDarkMode ? ThemeData(
        brightness: Brightness.dark,
        primaryColor: theme?.primaryColor,
        // Add other theme properties as needed
      ) : null,
      themeMode: supportDarkMode ? ThemeMode.system : ThemeMode.light,
      home: home,
      title: title,
      routes: routes ?? {},
      initialRoute: initialRoute,
      navigatorKey: navigatorKey,
      navigatorObservers: navigatorObservers ?? const <NavigatorObserver>[],
      onGenerateRoute: onGenerateRoute,
      onUnknownRoute: onUnknownRoute,
      supportedLocales: supportedLocales ?? const [Locale('en', 'US')],
      locale: locale,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner ?? false,
      showPerformanceOverlay: showPerformanceOverlay ?? false,
      showSemanticsDebugger: showSemanticsDebugger ?? false,
      localizationsDelegates: localizationsDelegates,
      localeResolutionCallback: localeResolutionCallback,
    );
  }
}