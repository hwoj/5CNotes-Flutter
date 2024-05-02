import 'package:fivec_notes/main.dart';
import 'package:fivec_notes/screens/home_screen.dart';
import 'package:fivec_notes/screens/login_screen.dart';
import 'package:fivec_notes/screens/signup_screen.dart';
import 'package:fivec_notes/themes/app_colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';


void main() {

  // Test correct email and password

  // Test wrong password


  // test login redirect

  // test initially empty controllers

  group("Test login operations for screen", () {

    testWidgets("Incorrect Login Credentials Test", (tester) async {
      await tester.pumpWidget(ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer(
        builder: (BuildContext context, ThemeNotifier themeNotifier, _) {
          return MaterialApp(
            home: LoginScreen(),
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
      final  observer = NavigatorObserver(); // check for page redirects
      String incorrectEmail = "incorrect email";
      String incorrectPassword = "incorrect password";

      await tester.enterText(find.byKey(const Key("Email text box")), incorrectEmail);

      await tester.enterText(find.byKey(const Key("Password text box")), incorrectPassword);

      final loginButton = find.byKey(const Key("Login button"));

      await tester.tap(loginButton);

      // rebuild app after pressing button to reflect changes
      await tester.pump();

      final errorModal = find.byKey(const Key("Incorrect email or password modal"));

      expect(errorModal, findsOneWidget);

    }
  );
    testWidgets("Correct Login Credentials Test", (tester) async {
      await tester.pumpWidget(ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer(
        builder: (BuildContext context, ThemeNotifier themeNotifier, _) {
          return MaterialApp(
            home: LoginScreen(),
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
      String correctEmail = "email";
      String correctPassword = "password";

      final observer = NavigatorObserver();
      await tester.enterText(find.byKey(const Key("Email text box")), correctEmail);

      await tester.enterText(find.byKey(const Key("Password text box")), correctPassword);

      final loginButton = find.byKey(const Key("Login button"));

      await tester.tap(loginButton);

      // rebuild app after pressing button to reflect changes

      await tester.pump();

      verify(observer.didPush(MaterialPageRoute(builder: (context) => LoginScreen()), MaterialPageRoute(builder: (context) => SignupScreen())));

      final nextScreen = find.byType(HomeScreen);

      expect(nextScreen, findsOneWidget);
    }
  );
  
  }
);

group("Test redirect to signup screen", () { 
  testWidgets("Test redirect to signup screen", (tester) async {
      await tester.pumpWidget(ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer(
        builder: (BuildContext context, ThemeNotifier themeNotifier, _) {
          return MaterialApp(
            home: LoginScreen(),
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
);

}

