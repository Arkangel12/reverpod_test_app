import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _isDarkThemeKey = 'isDarkThemeKey';

class ThemeChangeNotifier with ChangeNotifier {
  late final SharedPreferences _sharedPreferences;

   ThemeChangeNotifier(this._sharedPreferences) {
    isDarkThemeEnable();
  }

  bool? _isDarkTheme;

  bool get isDarkTheme => _isDarkTheme!;

  void isDarkThemeEnable() async {
    _isDarkTheme = _sharedPreferences.getBool(_isDarkThemeKey) ?? false;
    notifyListeners();
  }

  void setTheme(bool isDark) async {
    await _sharedPreferences.setBool(_isDarkThemeKey, isDark);
    _isDarkTheme = isDark;
    notifyListeners();
  }
}