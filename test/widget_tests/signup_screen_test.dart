import 'package:fivec_notes/main.dart';
import 'package:fivec_notes/screens/signup_screen.dart';
import 'package:fivec_notes/themes/app_colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';


void main() {

  // test initially empty controllers 

  // test password and confirm password texts are the same
  String email = "email";
  String password = "password";
  String confirmPassword = "password";
  String wrongConfirmPassword = "wrong";
  final signupButton = find.byKey(const Key("Signup button"));
  final nonMatchingPasswords = find.byKey(const Key("Non-matching passwords"));
  final emptyField = find.byKey(const Key("Empty field"));

  testWidgets("Passwords do not match", (tester) async {
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

      await tester.enterText(find.byKey(const Key("Register email")), email);
      await tester.enterText(find.byKey(const Key("Register password")), password);
      await tester.enterText(find.byKey(const Key("Confirm password")), wrongConfirmPassword);
      
      
      await tester.tap(signupButton);

      // rebuild app after pressing button to reflect changes

      await tester.pump();

      expect(nonMatchingPasswords, findsOneWidget);

    }
  );

   testWidgets("all empty fields", (tester) async {
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

      await tester.enterText(find.byKey(const Key("Register email")), "");
      await tester.enterText(find.byKey(const Key("Register password")), "");
      await tester.enterText(find.byKey(const Key("Confirm password")), "");
      
      
      await tester.tap(signupButton);

      // rebuild app after pressing button to reflect changes

      await tester.pump();

      expect(emptyField, findsOneWidget);

    }
  );

  testWidgets("empty email field", (tester) async {
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
      
      await tester.enterText(find.byKey(const Key("Register email")), "");
      await tester.enterText(find.byKey(const Key("Register password")), password);
      await tester.enterText(find.byKey(const Key("Confirm password")), confirmPassword);
      
      
      await tester.tap(signupButton);

      // rebuild app after pressing button to reflect changes

      await tester.pump();

      expect(emptyField, findsOneWidget);

    }
  );

    testWidgets("empty password field", (tester) async {
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
      
      await tester.enterText(find.byKey(const Key("Register email")), email);
      await tester.enterText(find.byKey(const Key("Register password")), password);
      await tester.enterText(find.byKey(const Key("Confirm password")), "");
      
      
      await tester.tap(signupButton);

      // rebuild app after pressing button to reflect changes

      await tester.pump();

      expect(emptyField, findsOneWidget);

    }
  );

  testWidgets("Email Verification redirect (all entered fields were valid)", (tester) async {
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
      
      await tester.enterText(find.byKey(const Key("Register email")), email);
      await tester.enterText(find.byKey(const Key("Register password")), password);
      await tester.enterText(find.byKey(const Key("Confirm password")), confirmPassword);
      
      
      await tester.tap(signupButton);

      // rebuild app after pressing button to reflect changes

      await tester.pump();

      expect(emptyField, findsOneWidget);

    }
  );

}