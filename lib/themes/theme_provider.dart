import 'package:fivec_notes/themes/app_colors_theme.dart';
import 'package:flutter/material.dart';

/// Changes the theme between light and dark mode for the app

class ThemeProvider with ChangeNotifier {
  AppColorsTheme _theme = AppColorsTheme.light();
  
  // Theme getter
  AppColorsTheme get theme => _theme;

  // Theme setter
  set themeData(AppColorsTheme theme) {
      _theme = theme;
  }

  /// Toggles between light and dark mode
  void toggleTheme() {
    if (_theme == AppColorsTheme.light()) {
      _theme = AppColorsTheme.dark();
    } else {
      _theme = AppColorsTheme.light();
    }
  }
}