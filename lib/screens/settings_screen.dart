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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(),
    );
  }
}