import 'package:fivec_notes/main.dart';
import 'package:fivec_notes/screens/home_screen.dart';
import 'package:fivec_notes/screens/login_screen.dart';
import 'package:fivec_notes/screens/signup_screen.dart';
import 'package:fivec_notes/themes/app_colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:mockito/mockito.dart';


void testCredentials(WidgetTester tester, String email, String password) async {
  await tester.enterText(find.byKey(const Key("Email text box")), email);
  await tester.enterText(find.byKey(const Key("Password text box")), password);
  
  final loginButton = find.byKey(const Key("Login button"));
  
  await tester.tap(loginButton);

  // rebuild app after pressing button to reflect changes

  await tester.pump();

  final errorModal = find.byKey(const Key("Incorrect email or password modal"));

  expect(errorModal, findsOneWidget);

  // clear text editing controllers 
  await tester.enterText(find.byKey(const Key("Email text box")), '');
  await tester.enterText(find.byKey(const Key("Password text box")), '');
}

class MockNavigationObserver extends Mock implements NavigatorObserver {}
void main() {

  // Test correct email and password

  // Test wrong password


  // test login redirect

  // test initially empty controllers

  String incorrectEmail = "incorrect email";
  String incorrectPassword = "incorrect password";
  String correctEmail = "email";
  String correctPassword = "password";

  group("Test login operations for screen", () {

    String incorrectEmail = "incorrect email";
    String incorrectPassword = "incorrect password";
    String correctEmail = "email";
    String correctPassword = "password";
    final loginButton = find.byKey(const Key("Login button"));

    final errorModal = find.byKey(const Key("Incorrect email or password modal"));

    testWidgets("Incorrect emal and password Test", (tester) async {
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

      // test incorrect email and password

      await tester.enterText(find.byKey(const Key("Email text box")), incorrectEmail);
      await tester.enterText(find.byKey(const Key("Password text box")), incorrectPassword);
      
      
      await tester.tap(loginButton);

      // rebuild app after pressing button to reflect changes

      await tester.pump();


      expect(errorModal, findsOneWidget);

    }
  );
  testWidgets("Incorrect Email, Correct Password", (tester) async {
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
    // test incorrect email, correct password

      await tester.enterText(find.byKey(const Key("Email text box")), incorrectEmail);
      await tester.enterText(find.byKey(const Key("Password text box")), correctPassword);

      
      await tester.tap(loginButton);

      // rebuild app after pressing button to reflect changes

      await tester.pump();

      expect(errorModal, findsOneWidget);
  });
  testWidgets("Correct Email, incorrect Password", (tester) async {
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
      // test correct email, incorrect password

      await tester.enterText(find.byKey(const Key("Email text box")), correctEmail);
      await tester.enterText(find.byKey(const Key("Password text box")), incorrectPassword);

      await tester.tap(loginButton);

      // rebuild app after pressing button to reflect changes

      await tester.pump();


      expect(errorModal, findsOneWidget);

  });

  testWidgets("empty email entry, empty Password entry", (tester) async {
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
      await tester.enterText(find.byKey(const Key("Email text box")), '');
      await tester.enterText(find.byKey(const Key("Password text box")), '');

      await tester.tap(loginButton);

      // rebuild app after pressing button to reflect changes

      await tester.pump();


      expect(errorModal, findsOneWidget);
    }
  );
    testWidgets("Correct Login Credentials Test", (tester) async {
      final mockObserver = MockNavigationObserver();
      await tester.pumpWidget(ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer(
        builder: (BuildContext context, ThemeNotifier themeNotifier, _) {
          return MaterialApp(
            navigatorObservers: [mockObserver], // for testing navigation
            routes: {
              '/' : (context) => LoginScreen(),
              '/signup' : (context) => SignupScreen(),
              '/homescreen' : (context) => HomeScreen(),
            },
            initialRoute: "/",
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

      await tester.enterText(find.byKey(const Key("Email text box")), correctEmail);

      await tester.enterText(find.byKey(const Key("Password text box")), correctPassword);

      final loginButton = find.byKey(const Key("Login button"));

      await tester.tap(loginButton);

      // rebuild app after pressing button to reflect changes

      await tester.pumpAndSettle();

      verify(mockObserver.didPush(MaterialPageRoute(builder: (context) => LoginScreen()), MaterialPageRoute(builder: (context) => SignupScreen())));
      
      final nextScreen = find.byType(HomeScreen);

      expect(nextScreen, findsOneWidget);
    }
  );
  
  }
);

group("Login Screen redirects", () { 
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

