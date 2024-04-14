import 'package:fivec_notes/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:fivec_notes/screens/settings_screen.dart';
import 'package:fivec_notes/main.dart';

/// The [TopBar] widget is a [StatelessWidget] that represents the bar at the top of the screen of the application
///
/// The widget is going to be present in the different application screens. 
/// As it will be reused across the app, instead of redefining a custom [AppBar] in every screen we're creating a reusable widget
/// In order to satisfy the appBar parameter of the [Scaffold] widget this will live under, we must implement it as a 
/// [PreferredSizeWidget]
class TopBar extends StatefulWidget implements PreferredSizeWidget {

  /// Creates the app widget to build the structure of the topbar. 
  /// 
  /// The widget returned should create the buttons and define their actions.
  @override
  State<TopBar> createState() => _TopBarState();
  /// Gets parameter so the TopBar fits the screen dimensions
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _TopBarState extends State<TopBar> {
  /// Creates the dropdown menu when the tree dots button
  /// is pressed. 
  /// 
  /// There will be an [IconButton] on the top right that when
  /// pressed, will display a modal screen.  This will have two
  /// buttons: one to redirect to the settings page, and another one 
  /// to logout. 
   _dropdown(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              height: 200.0, // Set desired height
              width: 200.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      // Handle take photo action
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SettingsScreen()));
                    },
                    child: Text("Settings"),
                  ),
                  SizedBox(height: 16.0), // Space between buttons
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                  child: Text("Logout"),
                  ),
            
                ],
              ),
            ),
          );
        },
      );
  }


   @override
  Widget build(BuildContext context) {
    /// The [AppBar] widget should have 
    /// [IconButton] widgets to define the back button and hamburger menu on the top left,
    /// [FlutterLogo] logo in the center, and a [ShowDialogue] manage access and [Scrollable] user dropdown menu on the 
    /// top right.  Use the function Navigation.of(context).push() Navigation.of(context).pop()
    /// to move back and forth between screens.
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_vert),
            tooltip: "Open menu options",
            onPressed: () {
              _dropdown(context);
            },
            )
        ]
      ),
      
      );
    }


}
