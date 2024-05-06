import 'package:fivec_notes/main.dart';
import 'package:fivec_notes/screens/settings_screen.dart';
import 'package:fivec_notes/screens/signup_screen.dart';
import 'package:fivec_notes/themes/app_colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {

  // test light and dark mode

  // test change password button

  // test saving files to local device 

  ThemeNotifier themeNotifier = ThemeNotifier();
  testWidgets("Settings Light to Dark theme toggle test", (tester) async {
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer(
        builder: (BuildContext context, ThemeNotifier themeNotifier, _) {
          return MaterialApp(

            home: SettingsScreen(),
            themeMode: themeNotifier.themeMode,
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
        )
    )
    );

    final themeSwitch = find.byKey(const Key("theme switch"));

    ThemeMode currentTheme = themeNotifier.themeMode;

    expect(currentTheme, ThemeMode.light);

    await tester.tap(themeSwitch);
    
    await tester.pump();

    expect(themeNotifier.themeMode, ThemeMode.dark);

  }
  );
  

}