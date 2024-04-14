import 'package:fivec_notes/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// Defines the Dropdown menu to access user settings 
/// screen and logout

class Dropdown extends StatefulWidget {

  /// Impleements the [Scrollable] widget that 
  /// will create a scrolling dropdown menu. 
  /// Use a [ListView] list to create 
  /// various buttons that will redirect users 
  /// to either the settings screen.
  
  final Dropdown dropdown;
  
  const Dropdown({
    Key? key ,
    required this.dropdown
  }) : super(key: key);

  @override
  State<Dropdown> createState() => DropdownState();
}

class DropdownState extends State<Dropdown> {
   
}