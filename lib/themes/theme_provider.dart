import 'package:fivec_notes/themes/app_colors_theme.dart';
import 'package:fivec_notes/themes/theme_data.dart';
import 'package:flutter/material.dart';

/// Changes the theme between light and dark mode for the app

class ThemeProvider with ChangeNotifier {
  ThemeData _theme = lightMode;
  
  // Theme getter
  ThemeData get theme => _theme;

  // Theme setter
  set themeData(ThemeData theme) {
      _theme = theme;
  }

  /// Toggles between light and dark mode
  void toggleTheme() {
    if (_theme == lightMode) {
      _theme = darkMode;
    } else {
      _theme = lightMode;
    }
  }
}