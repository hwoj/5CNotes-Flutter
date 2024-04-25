import 'package:fivec_notes/themes/app_colors_theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  AppColorsTheme _theme = AppColorsTheme.light();
  AppColorsTheme get theme => _theme;

  set themeData(AppColorsTheme theme) {
      _theme = theme;
  }

  void toggleTheme() {
    if (_theme == AppColorsTheme.light()) {
      _theme = AppColorsTheme.dark();
    } else {
      _theme = AppColorsTheme.light();
    }
  }
}