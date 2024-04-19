import 'package:fivec_notes/screens/login_screen.dart';
import 'package:fivec_notes/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// Defines theMenuDropdown menu to access user settings 
/// screen and logout

class MenuDropdown extends StatefulWidget {

  /// Impleements the [Scrollable] widget that 
  /// will create a scrolling dropdown menu. 
  /// Use a [ListView] list to create 
  /// various buttons that will redirect users 
  /// to either the settings screen.
  
  
  const MenuDropdown({
    Key? key ,
  }) : super(key: key);

  @override
  State<MenuDropdown> createState() =>MenuDropdownState();
}

class MenuDropdownState extends State<MenuDropdown> {

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: (context) {
          return [
            PopupMenuItem<int>(
              value: 0,
              child: Text("Settings"),
            ),
            PopupMenuItem<int>(
              value: 1,
              child: Text("Logout"),
            ),
          ];
        },
        onSelected:(value) {
          if (value == 0) {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => SettingsScreen())
              );
          } else {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => LoginScreen())
            );
          }
        },
      );
  }
}