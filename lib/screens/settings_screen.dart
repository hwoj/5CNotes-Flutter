import 'package:fivec_notes/main.dart';
import 'package:fivec_notes/screens/change_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:fivec_notes/widgets/top_bar.dart';
import 'package:provider/provider.dart';

/// Screen that will allow a user to change their app settings.
/// 
/// Options available are to switch between light and dark mode, change password,
/// and save files to the local device. 
class SettingsScreen extends StatefulWidget {


  @override
  State<SettingsScreen> createState() => _SettingsScreenState();

}

class _SettingsScreenState extends State<SettingsScreen> {
  ThemeMode themeMode = ThemeMode.system;
  /// Builds the three options of the Settings UI
  /// 
  /// Will create three [ListTile] objects wrapped within a [ListView]
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appColors.backgroundRow,
      appBar: TopBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Consumer(
              builder: (BuildContext context, ThemeNotifier themeNotifier, _) {
                return ListTile(
                  title: Text(
                    "Switch to Dark Mode",
                    style: TextStyle(
                      color: Theme.of(context).appColors.textDefault
                    ),
                  ),
                  trailing: Switch(
                    value: themeNotifier.themeMode == ThemeMode.dark,
                    onChanged: (isOn) {
                      themeNotifier.toggleTheme();
                    }
                    )
                );
              }
            ),
            
            ListTile(
              title: Text(
                "Change Password",
                style: TextStyle(
                  color: Theme.of(context).appColors.textDefault
                ),
              ),
              trailing: TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 10),
                ),
                onPressed: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => ChangePasswordScreen()),
                  );
                },
                child: const Text('Change'),
              ),
            ),
            ListTile(
              title: Text(
                "Save files to device",
                style: TextStyle(
                  color: Theme.of(context).appColors.textDefault
                ),
              ),
              trailing: TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 10),
                ),
                onPressed: () {
                  // TODO: save files to local device
                },
                child: const Text("Save"),
              )
            ),
          ],
        )
        )
    );
  }
}