import 'package:fivec_notes/screens/home_screen.dart';
import 'package:fivec_notes/screens/splash_screen.dart';
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
      routes: {
        '/home': (context) => HomeScreen()
      },
      home: SplashScreen(),
      theme: Theme.of(context).copyWith(
        extensions: [
          AppColorsTheme.light()
        ]
      ),
    );
  }
}

/// Exposing the app themes to all files
extension ThemeDataExtended on ThemeData {
  AppColorsTheme get appColors =>extension<AppColorsTheme>()!;
}
