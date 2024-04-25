import 'package:fivec_notes/main.dart';
import 'package:fivec_notes/themes/app_colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:fivec_notes/widgets/top_bar.dart';
import 'package:flutter/material.dart';
/// Settings Screen TODO
/// 
/// Light Mode
/// Dark Mode 
/// Change Password 
/// Save files to Device
/// 

class SettingsScreen extends StatefulWidget {


  @override
  State<SettingsScreen> createState() => _SettingsScreenState();

}

class _SettingsScreenState extends State<SettingsScreen> {
  ThemeMode themeMode = ThemeMode.system;

  void toggleTheme(ThemeMode mode) {
    setState(() {
      themeMode = mode;
    }

    );
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
       appBar: TopBar(),
     body: Padding(
       padding: EdgeInsets.all(16.0),
       child: ListView(
         children: <Widget>[
           ListTile(
             title: const Text("Switch to Dark Mode"),
            trailing: Switch(
              value: isDarkMode,
              onChanged: (isOn) {
                isOn
                ? toggleTheme(ThemeMode.dark)
                : toggleTheme(ThemeMode.light);
               }
               )
           )

        ],
       )
       )
    );
  }
}