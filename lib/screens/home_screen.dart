import 'package:fivec_notes/widgets/top_bar.dart';
import 'package:flutter/material.dart';

/// [HomeScreen] is a [StatefulWidget] responsible for most of the application interfaces the user will use
/// 
/// This screen will include the main widgets for the file directory and the active note.
/// The main [State] of the [HomeScreen] is [_HomeScreenState]
class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

/// This is the primary state for the [HomeScreen] screen
/// 
/// This state will encompass both the note and file directory widgets
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(),
    );
  }
}