library sunday_ui;

import 'dart:ui';

import 'package:sunday_core/GetGtorage/get_storage.dart';
import 'package:sunday_ui/Scripts/Colors/storing_color/storing_color.dart';

Future<void> initUI({Object? globals}) async {
  final box = SundayGetStorage();

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
