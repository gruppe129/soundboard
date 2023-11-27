// Package imports:
import 'package:shared_preferences/shared_preferences.dart';

class ThemePrefs {
  static const TYPE = "THEME";

  setDarkTheme(bool val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(TYPE, val);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(TYPE) ?? false;
  }
}
