
import 'package:fivec_notes/screens/change_password_screen.dart';
import 'package:fivec_notes/screens/email_verification_screen.dart';
import 'package:fivec_notes/screens/home_screen.dart';
import 'package:fivec_notes/screens/login_screen.dart';
import 'package:fivec_notes/screens/settings_screen.dart';
import 'package:fivec_notes/screens/signup_screen.dart';
import 'package:fivec_notes/themes/app_colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MainApp());
}



class ThemeNotifier extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void setTheme(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }

}
class MainApp extends StatelessWidget {
  const MainApp({super.key});


  Future<bool> isThemeDark() async {
    ThemeNotifier notifier = ThemeNotifier();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDark = prefs.getBool('isDarkMode') ?? false;
    if (isDark) {
      notifier.setTheme(ThemeMode.dark);
    }
    return isDark;
  }

  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer(
        builder: (BuildContext context, ThemeNotifier themeNotifier, _) {
          return FutureBuilder<bool>(
            future: isThemeDark(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final bool isDarkTheme = snapshot.data ?? false;
                return MaterialApp(
                  home: LoginScreen(),
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
                  routes: {
                      '/login' : (context) => LoginScreen(),
                      '/signup' : (context) => SignupScreen(),
                      '/change_password': (context) => ChangePasswordScreen(),
                      '/email_verification' : (context) => EmailVerificationScreen(),
                      '/settings' : (context) => SettingsScreen(), 
                      '/home' : (context) => HomeScreen(),
                    },
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
              
            }
          );
        }
        )
    );
  }
}


/// Exposing the app themes to all files
extension ThemeDataExtended on ThemeData {
  AppColorsTheme get appColors =>extension<AppColorsTheme>()!;
}