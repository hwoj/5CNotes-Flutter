import 'package:fivec_notes/main.dart';
import 'package:fivec_notes/screens/settings_screen.dart';
import 'package:fivec_notes/screens/signup_screen.dart';
import 'package:fivec_notes/themes/app_colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:mockito/mockito.dart';

void main() {

  // test light and dark mode

  ThemeNotifier themeNotifier = ThemeNotifier();
  testWidgets("Settings theme toggle test", (tester) async {
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer(
        builder: (BuildContext context, ThemeNotifier themeNotifier, _) {
          return FutureBuilder<bool>(
            future: MainApp().isThemeDark(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final bool isDarkTheme = snapshot.data ?? false;
                return MaterialApp(
                  home: SettingsScreen(),
                  themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
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
              } else {
                return MaterialApp(
                  home: SettingsScreen(), //  default page
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
              
            }
          );
        }
        )
    )
    );

    final themeSwitch = find.byKey(const Key("theme switch with some null data"));

    ThemeMode currentTheme = themeNotifier.themeMode;

    await tester.tap(themeSwitch);

    ThemeMode newTheme = themeNotifier.themeMode;
    
    await tester.pump();

    expect(currentTheme, isNot(newTheme));

  }
  );
  

}