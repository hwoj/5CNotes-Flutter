
import 'package:fivec_notes/screens/login_screen.dart';
import 'package:fivec_notes/themes/app_colors_theme.dart';
import 'package:fivec_notes/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      theme: Provider.of<ThemeProvider>(context).theme,
    );
  }
}

/// Exposing the app themes to all files
extension ThemeDataExtended on ThemeData {
  AppColorsTheme get appColors =>extension<AppColorsTheme>()!;
}