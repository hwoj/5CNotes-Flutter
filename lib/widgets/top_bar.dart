import 'package:flutter/material.dart';


/// The [TopBar] widget is a [StatelessWidget] that represents the bar at the top of the screen of the application
///
/// The widget is going to be present in the different application screens. 
/// As it will be reused across the app, instead of redefining a custom [AppBar] in every screen we're creating a reusable widget
/// In order to satisfy the appBar parameter of the [Scaffold] widget this will live under, we must implement it as a 
/// [PreferredSizeWidget]

class TopBar extends StatelessWidget implements PreferredSizeWidget{

  /// Creates the app widget to build the structure of the topbar. 
  /// 
  /// The widget returned should create the buttons and define their actions.
  /// params: [BuildContext] context
  /// returns: [AppBar] widget
  @override
  Widget build(BuildContext context) {
    return AppBar(

    );
  }

  /// Gets parameter so the TopBar fits the screen dimensions
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}