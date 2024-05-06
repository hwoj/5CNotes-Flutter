import 'package:fivec_notes/main.dart';
import 'package:fivec_notes/models/file.dart';
import 'package:fivec_notes/widgets/filetree/file_tree.dart';
import 'package:fivec_notes/widgets/open_document.dart';
import 'package:fivec_notes/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// [HomeScreen] is a [StatefulWidget] responsible for most of the application interfaces the user will use
/// 
/// This screen will include the main widgets for the file directory and the active note.
/// The main [State] of the [HomeScreen] is [_HomeScreenState]
class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

/// This is the primary state for the [HomeScreen] screen
/// 
/// This state will encompass both the [OpenDocument] and [FileTree] widgets
class HomeScreenState extends State<HomeScreen> {

  final GlobalKey<OpenDocumentState> openDocumentKey = GlobalKey();
  late ThemeNotifier notifier;

  @override
  void initState() {
    super.initState();
    // notifier = ThemeNotifier();
    // notifier.setTheme(ThemeMode.dark);
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appColors.backgroundRow,
      appBar: TopBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FileTree(docKey: openDocumentKey),
            const SizedBox(width: 16,),
            Expanded(
              child: OpenDocument(key: openDocumentKey, file: File(uuid: "-", name: "-")),
            )
            
          ]
        ),
      ),
    );
  }
}