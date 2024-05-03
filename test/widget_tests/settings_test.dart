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

  testWidgets("Settings Test", (tester) async {
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer(
        builder: (BuildContext context, ThemeNotifier themeNotifier, _) {
          return MaterialApp(

            home: SignupScreen(),
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

    
  }
  );
  

}