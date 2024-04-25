import 'package:fivec_notes/screens/change_password_screen.dart';
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

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
       appBar: TopBar(),
     body: Padding(
       padding: const EdgeInsets.all(16.0),
       child: ListView(
         children: <Widget>[
           ListTile(
             title: const Text("Switch to Dark Mode"),
            trailing: Switch(
              value: isDarkMode,
              onChanged: (isOn) {
                
               }
               )
           ),
           ListTile(
            title: const Text("Change Password"),
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
            title: const Text("Save files to device"),
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