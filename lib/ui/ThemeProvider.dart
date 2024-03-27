import 'package:flutter/material.dart';

import 'color_schemes.g.dart';

class ThemeProvider extends ChangeNotifier {
  final ThemeData _lightTheme = ThemeData.from(
    colorScheme: lightColorScheme,
  );

  final ThemeData _darkTheme = ThemeData.from(
    colorScheme: darkColorScheme,
  );

  ThemeData _currentTheme = ThemeData.from(
    colorScheme: lightColorScheme,
  );

  ThemeData get themeData => _currentTheme;

  void toggleTheme() {
    _currentTheme = _currentTheme == _lightTheme ? _darkTheme : _lightTheme;
    notifyListeners();
  }
}
