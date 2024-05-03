import 'package:fivec_notes/main.dart';
import 'package:fivec_notes/screens/change_password_screen.dart';
import 'package:fivec_notes/screens/home_screen.dart';
import 'package:fivec_notes/screens/login_screen.dart';
import 'package:fivec_notes/screens/signup_screen.dart';
import 'package:fivec_notes/themes/app_colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {

  // test button and controllers exists 

  // test colors for light and dark mode

  // test initially empty controllers 

  // test that old password is correct

  // test new password and confirm password texts match 

  group("Test matching credentials", () {
    String oldPassword = "password";
    String incorrectPassword = "incorrect password";
    String newPassword = "newPassword";
    String wrongMatchingPassword = "wrong password";
    final changePasswordButton = find.byKey(const Key("change password button"));

    testWidgets("Empty fields", (tester) async {
      await tester.pumpWidget(ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer(
        builder: (BuildContext context, ThemeNotifier themeNotifier, _) {

          return MaterialApp(
            // navigatorObservers: [mockObserver], // for testing navigation
            home: ChangePasswordScreen(),
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

    await tester.enterText(find.byKey(const Key("old password")), "");
    await tester.enterText(find.byKey(const Key("new password")), "");
    await tester.enterText(find.byKey(const Key("confirm password")), "");
    
    await tester.tap(changePasswordButton);

    await tester.pump();

    expect(find.byKey(const Key("Change password empty field")), findsOneWidget);
  }
  );

  testWidgets("Test incorrect old password attempt", (tester) async {
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer(
        builder: (BuildContext context, ThemeNotifier themeNotifier, _) {

          return MaterialApp(
            // navigatorObservers: [mockObserver], // for testing navigation
            home: ChangePasswordScreen(),
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

    await tester.enterText(find.byKey(const Key("old password")), oldPassword);
    await tester.enterText(find.byKey(const Key("new password")), newPassword);
    await tester.enterText(find.byKey(const Key("confirm password")), wrongMatchingPassword);
    
    await tester.tap(changePasswordButton);

    await tester.pump();

    expect(find.byKey(const Key("credentials do not match")), findsOneWidget);
  }

  );

  testWidgets("Old password is incorrect", (tester) async {
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer(
        builder: (BuildContext context, ThemeNotifier themeNotifier, _) {

          return MaterialApp(
            // navigatorObservers: [mockObserver], // for testing navigation
            home: ChangePasswordScreen(),
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

    await tester.enterText(find.byKey(const Key("old password")), incorrectPassword);
    await tester.enterText(find.byKey(const Key("new password")), newPassword);
    await tester.enterText(find.byKey(const Key("confirm password")), newPassword);
    
    await tester.tap(changePasswordButton);

    await tester.pump();

    expect(find.byKey(const Key("credentials do not match")), findsOneWidget);
  });

     testWidgets("Old password is incorrect", (tester) async {
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer(
        builder: (BuildContext context, ThemeNotifier themeNotifier, _) {

          return MaterialApp(
            // navigatorObservers: [mockObserver], // for testing navigation
            home: ChangePasswordScreen(),
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

    await tester.enterText(find.byKey(const Key("old password")), incorrectPassword);
    await tester.enterText(find.byKey(const Key("new password")), newPassword);
    await tester.enterText(find.byKey(const Key("confirm password")), newPassword);
    
    await tester.tap(changePasswordButton);

    await tester.pump();

  }

  );
    
});
    
}
  


