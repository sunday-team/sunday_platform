library sunday_ui;

import 'dart:ui';

import 'package:sunday_get_storage/sunday_get_storage.dart';
import 'package:sunday_ui/Scripts/Colors/storing_color/storing_color.dart';

/// export specific files
export 'style.dart';

/// export main components
export 'MainComponents/sunday_list_header/sunday_list_header.dart';
export 'MainComponents/sunday_list_tile/sunday_list_tile.dart';
export 'MainComponents/sunday_list_view/sunday_list_view.dart';
export 'MainComponents/sunday_text/sunday_text.dart';
export 'MainComponents/sunday_text_button/sunday_text_button.dart';
export 'MainComponents/sunday_text_field/sunday_text_field.dart';
export 'MainComponents/sunday_layout/sidebar_layout/group.dart';
export 'MainComponents/sunday_layout/sidebar_layout/item.dart';
export 'MainComponents/sunday_layout/sidebar_layout/view.dart';
export 'MainComponents/sunday_layout/sunday_layout.dart';
export 'MainComponents/sunday_layout/sidebar_layout/toogle_button.dart';

/// export scripts
export 'Scripts/Colors/storing_color/storing_color.dart';

/// export core components
export 'CoreComponents/sunday_app/sunday_app.dart';
export 'CoreComponents/sunday_appbar/sunday_appbar.dart';
export 'CoreComponents/sunday_bottom_bar/sunday_bottom_bar.dart';
export 'CoreComponents/sunday_navigationbar_item/sunday_navigationbar_item.dart';
export 'CoreComponents/sunday_scaffold/sunday_scaffold.dart';

/// Initializes the UI settings and stores them in the SundayGetStorage.
///
/// This function initializes the global UI settings and writes them to the storage.
/// If no globals are provided, it uses the default settings. The settings include
/// default UI styles for different platforms, color schemes, border styles, radius
/// values, font settings, and shadow settings.
///
/// The [globals] parameter is an optional object that contains the UI settings.
/// If [globals] is not provided, the function uses the default settings.
///
/// Example usage:
/// ```dart
/// await initUI();
/// ```
///
/// Args:
///   globals (Object?): An optional object containing the UI settings.
///
/// Returns:
///   Future<void>: A future that completes when the operation is done.
Future<void> initUI({Object? globals}) async {
  final box = GetStorage();

  globals ??= {
    "default-ui": {
      "windows": "ui-material",
      "macos": "ui-cupertino",
      "linux": "ui-material",
      "web": "ui-cupertino",
      "android": "ui-material",
      "ios": "ui-cupertino",
    },
    "colors": {
      "elements": {
        "primary": {
          "light": convertColor(const Color(0xFF000000)),
          "dark": convertColor(const Color(0xFF000000)),
        },
        "secondary": {
          "light": convertColor(const Color(0xFF000000)),
          "dark": convertColor(const Color(0xFF000000)),
        },
      },
      "text": {
        "primary": {
          "light": convertColor(const Color(0xFF000000)),
          "dark": convertColor(const Color(0xFF000000)),
        },
      },
    },
    "borders": {
      "primary": {
        "light": {
          "width": 1.0,
          "color": convertColor(const Color(0xFF000000)),
        },
        "dark": {
          "width": 0.5,
          "color": convertColor(const Color(0xFF000000)),
        },
      },
    },
    "radius": {
      "small": {
        "light": 4.0,
        "dark": 4.0,
      },
      "medium": {
        "light": 8.0,
        "dark": 8.0,
      },
      "large": {
        "light": 16.0,
        "dark": 16.0,
      },
    },
    "font": {
      "primary": {
        "light": "Roboto",
        "dark": "Roboto",
      },
    },
    "shadows": {
      "primary": {
        "light": const Offset(0, 1),
        "dark": const Offset(0, 1),
      },
    },
  };

  await box.write('sunday_ui:globals', globals);
}
