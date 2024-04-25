
import 'package:fivec_notes/screens/login_screen.dart';
import 'package:fivec_notes/themes/app_colors_theme.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: LoginScreen(),
      theme: Theme.of(context).copyWith(
        extensions: [
          AppColorsTheme.light()
        ]
      ),
      darkTheme: Theme.of(context).copyWith(
        extensions: [
          AppColorsTheme.dark()
        ]
      ),
    );
  }
}

/// Exposing the app themes to all files
extension ThemeDataExtended on ThemeData {
  AppColorsTheme get appColors =>extension<AppColorsTheme>()!;
}