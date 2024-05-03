import 'package:fivec_notes/main.dart';
import 'package:fivec_notes/screens/email_verification_screen.dart';
import 'package:fivec_notes/themes/app_colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {

  // test empty controllers 

  // test that buttons and text controllers exist

  // test email sent

  // test correct code given 
  
  group("Match verification code", () {

    String correctCode = "123";
    String incorrectCode = "456";
    final verifyCodeButton = find.byKey(const Key("verify code button"));
      testWidgets("Email Verification Test: Incorrect Credentials", (tester) async {
        await tester.pumpWidget(ChangeNotifierProvider(
          create: (_) => ThemeNotifier(),
          child: Consumer(
            builder: (BuildContext context, ThemeNotifier themeNotifier, _) {
              return MaterialApp(
                home: EmailVerificationScreen(),
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
          ));
          await tester.enterText(find.byKey(const Key("enter code field")), incorrectCode);

          await tester.tap(verifyCodeButton);

          await tester.pump();

          expect(find.byKey(const Key("incorrect code entered")), findsOneWidget);
      }
    );
    testWidgets("Email Verification Test: Correct Credentials", (tester) async {
        await tester.pumpWidget(ChangeNotifierProvider(
          create: (_) => ThemeNotifier(),
          child: Consumer(
            builder: (BuildContext context, ThemeNotifier themeNotifier, _) {
              return MaterialApp(
                home: EmailVerificationScreen(),
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
          ));
          await tester.enterText(find.byKey(const Key("enter code field")), incorrectCode);

          await tester.tap(verifyCodeButton);

          await tester.pump();

          expect(find.byKey(const Key("incorrect code entered")), findsOneWidget);
      }
    );

    }
  );
  

}