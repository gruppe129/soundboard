// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:jojo/components/theme.dart';
import 'package:jojo/components/theme_prefs.dart';

class ThemeProvider with ChangeNotifier {
  ThemePrefs themePrefs = ThemePrefs();
  bool _darkTheme = true;

  bool get getDarkTheme => _darkTheme;

  set setDarkTheme(bool val) {
    _darkTheme = val;
    themePrefs.setDarkTheme(val);
    notifyListeners();
  }
}
